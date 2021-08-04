using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Practice.Data.Repository;
using Practice.Models;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;

namespace Practice.Controllers
{
    public class HomeController : Controller
    {
        private readonly IRepo _repo;



        public HomeController(IRepo repo)
        {
            _repo = repo;
        }

        [HttpGet]
        public IActionResult Index()
        {

            return View(_repo.GetClassNames());
        }

        [HttpGet]
        public IActionResult Create(string? id)
        {

            TempData["ClassName"] = id;

            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Create(StudentDetails sD)
        {
            await _repo.CreateStudentDetails(sD);

            return RedirectToAction("Display", new { id = sD.ClassName });
        }


        [HttpGet]
        public IActionResult Display(String id = null)
        {
            if (id != null)
            {
                return RedirectToAction("SeeStudent", new { ClassName = id });
            }

            return View(_repo.GetStudentDetails());
        }

        [HttpGet]
        public IActionResult CreateClass()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> CreateClass(ClassName cN)
        {
            cN.DateCreated = DateTime.Now;
            await _repo.CreateNewClass(cN);
            return RedirectToAction("Index");
        }


        [HttpGet]
        public IActionResult SeeStudent(string className)
        {
            TempData["ClassName"] = className;

            return View("Display", _repo.GetSpecificStudentDetails(className));
        }

        [HttpGet]
        public async Task<IActionResult> DeleteClass([FromRoute] int id)
        {
            //Delete Students in the respective class tooo

            await _repo.DeleteClass(id);
            return RedirectToAction("Index");
        }

        public async Task<IActionResult> DeleteStudentDetails([FromRoute] int id)
        {
            //Delete Students in the respective class tooo

            await _repo.DeleteStudentDetails(id);
            return RedirectToAction("Display");
        }



        [HttpGet]
        public async Task<IActionResult> Edit(int id)
        {
            return View(await _repo.FindStudentDetails(id));
        }

        [HttpPost]
        public async Task<IActionResult> Edit(StudentDetails sd)
        {
            await _repo.EditStudentDetails(sd.Id, sd);
            return RedirectToAction("Display", new { id = sd.ClassName });
        }

        [HttpGet]
        public IActionResult OtherDeplays(String type)

        {
            if (type == "ASC")
            {
                ViewBag.type = "ASC";
                return View(_repo.OrderBYASC());
            }
            if (type == "DSC")
            {
                ViewBag.type = "DSC";
                return View(_repo.OrderBYDSC());
            }
            return View();
        }

        public IActionResult SearchStudentDetails(String SearchString)
        {
            if (!String.IsNullOrEmpty(SearchString))
            {
                return View("Display", _repo.Search(SearchString));

            }

            return View("Display");

        }







        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}

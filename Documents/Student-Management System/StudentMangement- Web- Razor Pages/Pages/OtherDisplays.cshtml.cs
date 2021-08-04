using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using StudentMangement.Data.Repository;
using StudentMangement.Models;

namespace StudentMangement.Pages
{
    public class OtherDisplaysModel : PageModel
    {


        private readonly IRepo _repo;

        public IEnumerable<StudentDetails> Students { get; set; }

        public OtherDisplaysModel(IRepo repo)
        {
            _repo = repo;
        }

        public IActionResult OnGet(String type)
        {
            if (type == "ASC")
            {
                ViewData["type"] = "ASC";
                Students = _repo.OrderBYASC();
                return Page();
            }
            if (type == "DSC")
            {
                ViewData["type"] = "DSC";
                Students = _repo.OrderBYDSC();
                return Page();
            }
            return Page();
        }
    }
}

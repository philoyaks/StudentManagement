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
    public class CreateModel : PageModel
    {
        private readonly IRepo _repo;
        public CreateModel(IRepo repo)
        {
            _repo = repo;
        }

        [BindProperty]
        public StudentDetails Student { get; set; }
        public void OnGet(string id)
        {
            TempData["ClassName"] = id;
        }

        public async Task<IActionResult> OnPost()
        {
            await _repo.CreateStudentDetails(Student);
            TempData["ClassName"] = Student.ClassName;
            return RedirectToPage("Display", new { id = Student.ClassName });
        }
    }
}

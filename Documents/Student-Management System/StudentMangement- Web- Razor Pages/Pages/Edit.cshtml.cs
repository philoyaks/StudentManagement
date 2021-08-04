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
    public class EditModel : PageModel
    {

        private readonly IRepo _repo;

        [BindProperty(SupportsGet = true)]
        public StudentDetails Student { get; set; }
        public EditModel(IRepo repo)
        {
            _repo = repo;
        }

        public async void OnGet(int id)
        {

            Student = await _repo.FindStudentDetails(id);
        }
        public async Task<IActionResult> OnPost()
        {
            await _repo.EditStudentDetails(Student.Id, Student);
            TempData["ClassName"] = Student.ClassName;
            return RedirectToPage("Display", new { id = Student.ClassName });
        }


    }
}

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
    public class DisplayModel : PageModel
    {

        private readonly IRepo _repo;

        [BindProperty(SupportsGet = true)]
        public List<StudentDetails> Students { get; set; }
        public DisplayModel(IRepo repo)
        {
            _repo = repo;
        }

        public IActionResult OnGet(String id = null)
        {
            if (id != null)
            {
                Students = _repo.GetSpecificStudentDetails(id).ToList();
                return Page();
            }
            Students = _repo.GetStudentDetails().ToList();
            return Page();
        }

        public async Task<IActionResult> OnGetDeleteStudentDetails(string classname, int? id = null)
        {
            if (id != null)
            {
                await _repo.DeleteStudentDetails((int)id);
                TempData["ClassName"] = classname;
                return RedirectToPage(new { id = classname });
            }
            return Page();

        }
        public IActionResult OnPostSearchStudentDetails(String SearchString)
        {
            if (!String.IsNullOrEmpty(SearchString))
            {
                Students = _repo.Search(SearchString).ToList();
                return Page();
            }
            return Page();
        }
    }
}

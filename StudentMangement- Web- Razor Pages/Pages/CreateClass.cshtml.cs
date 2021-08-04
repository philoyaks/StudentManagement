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
    public class CreateClassModel : PageModel
    {

        private readonly IRepo _repo;

        [BindProperty(SupportsGet = true)]
        public ClassName Classes { get; set; }

        public CreateClassModel(IRepo repo)
        {
            _repo = repo;
        }

        public void OnGet()
        {
        }

        public async Task<IActionResult> OnPostAsync()
        {
            Classes.DateCreated = DateTime.Now;
            await _repo.CreateNewClass(Classes);
            return RedirectToPage("Index");
        }
    }
}

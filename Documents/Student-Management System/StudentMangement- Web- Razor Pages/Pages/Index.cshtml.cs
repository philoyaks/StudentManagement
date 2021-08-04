using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Extensions.Logging;
using StudentMangement.Data.Repository;
using StudentMangement.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace StudentMangement.Pages
{
    public class IndexModel : PageModel
    {

        private readonly IRepo _repo;

        public IEnumerable<ClassName> Classes { get; set; }

        public IndexModel(IRepo repo)
        {
            _repo = repo;
        }

        public void OnGet()
        {
            Classes = _repo.GetClassNames();
        }
        public IActionResult OnGetSeeStudent(string className)
        {
            TempData["ClassName"] = className;
            return RedirectToPage("Display", new {id = className }); 
        }


        public async Task<IActionResult> OnGetDeleteClass(int id)
        {
            //Delete Students in the respective class tooo

            await _repo.DeleteClass(id);
            return RedirectToPage("Index");
        }
    }
}

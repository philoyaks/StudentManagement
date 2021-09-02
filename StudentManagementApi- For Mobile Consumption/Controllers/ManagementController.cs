using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using StudentManagementApi.Data;
using StudentManagementApi.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace StudentManagementApi.Controllers
{

    [ApiController]
    [Authorize]
    [Route("[controller]")]
    public class ManagementController : ControllerBase
    {


        private readonly IRepo _repo;

        public ManagementController(IRepo repo)
        {
            _repo = repo;
        }

        [HttpGet("students")]
        public IActionResult GetAllStudentsAsync()
        {
            return Ok(_repo.GetStudentDetails());
        }

        [HttpGet("class")]
        public IActionResult GetClassesDetails()
        {
            return Ok(_repo.GetClassNames());
        }


        [HttpPost("class")]
        public async Task<IActionResult> CreateStudentClass(ClassName className)
        {
            await _repo.CreateNewClass(className);
            return NoContent();
        }



        [HttpPost("students")]
        public IActionResult CreateStudentDetails(StudentDetails student)
        {
            _repo.CreateStudentDetails(student);
            return NoContent();
        }

        [HttpPost("students/Edit")]
        public IActionResult EditStudentDetails(StudentDetails student)
        {
            _repo.EditStudentDetails(student.Id, student);
            return NoContent();
        }


        [HttpDelete("class/{id}")]
        public IActionResult DeleteClass(String id)
        {
            if (id.Length < 0)
            {
                return BadRequest();
            }
            _repo.DeleteClass(id);
            return NoContent();
        }


        [HttpDelete("student/{id}")]
        public IActionResult DeleteStudentDetails(string id)
        {
            if (id.Length < 0)
            {
                return BadRequest();
            }
            _repo.DeleteStudentDetails(id);

            return NoContent();
        }


        [HttpGet("order/{param}")]
        public IActionResult OrderStudentDetails(string param)
        {
            if (param is "Asc")
            {
                return Ok(_repo.OrderBYASC());

            }
            if (param is "Dsc")
            {
                return Ok(_repo.OrderBYDSC());

            }

            return BadRequest();
        }

        [HttpGet("search/{searchName}")]
        public IActionResult SearchStudent(string searchName)
        {
            var result = _repo.SearchForStudents(searchName);


            return Ok(result);
        }







    }
}

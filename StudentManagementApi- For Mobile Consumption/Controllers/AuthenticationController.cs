using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using StudentManagementApi.Data;
using StudentManagementApi.Data.UserServices;
using StudentManagementApi.Models;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;

namespace StudentManagementApi.Controllers
{
    [ApiController]

    [Route("auth")]
    public class AuthenticationController : ControllerBase

    {
        private readonly IRepo _repo;
        private readonly UserServices _authservice;

        public AuthenticationController(IRepo repo, UserServices authservice)
        {
            _repo = repo;
            _authservice = authservice;

        }

        [HttpPost]
        [Route("Register")]
        public async Task<IActionResult> RegisterUser([FromBody] Users users)
        {
            //Registers the Students of the Class
            Users user = await _repo.CreateUser(users);
            string token = _authservice.Authencate(users, users.SchoolEmail, users.Password);
            return Ok(new { token, user });
        }

        [HttpPost]
        [Route("Login/{email}/{password}")]
        public async Task<IActionResult> Login(string email, string password)
        {
            var user = await _repo.GetUser(email, password);
            var token = _authservice.Authencate(user, email, password);
            if (token == null)
                return Unauthorized();
            return Ok(new { token, user });
        }

        [HttpGet]
        [Route("Logout")]
        public async Task<IActionResult> Logout()
        {


            return Ok(await _repo.GetAllUsers());
        }






    }
}

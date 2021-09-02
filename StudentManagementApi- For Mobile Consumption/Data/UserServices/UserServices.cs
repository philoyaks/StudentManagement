using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using StudentManagementApi.Models;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;

namespace StudentManagementApi.Data.UserServices
{
    public class UserServices
    {
        private readonly String key;

        public UserServices(IConfiguration configuration)
        {
            key = configuration.GetSection("JwtKey").ToString();
        }



        public string Authencate(Users user, string email, string password)
        {


            if (user == null)
                return null;

            var tokenHandler = new JwtSecurityTokenHandler();

            var tokenKey = Encoding.ASCII.GetBytes(key);

            var tokenDescriptor = new SecurityTokenDescriptor()
            {
                Subject = new ClaimsIdentity(new Claim[] {
                new Claim(ClaimTypes.Email, email),
                }),
                Expires = DateTime.UtcNow.AddHours(2),
                SigningCredentials = new SigningCredentials(
                new SymmetricSecurityKey(tokenKey),
                SecurityAlgorithms.HmacSha256Signature
                )

            };

            var token = tokenHandler.CreateToken(tokenDescriptor);
            return tokenHandler.WriteToken(token);


        }



    }
}

using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace StudentManagementApi.Models
{
    public class Users
    {
        [BsonId]
        [BsonRepresentation(BsonType.ObjectId)]
        public String Id { get; set; }

        [Required]
        public String Username { get; set; }

        [Required]
        public String SchoolEmail { get; set; }

        [Required]
        public String Password { get; set; }

        public DateTime SchoolFoundedYear { get; set; }
        public DateTime DateCreated { get; set; }


    }
}

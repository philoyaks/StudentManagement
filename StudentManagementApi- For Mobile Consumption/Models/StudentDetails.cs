using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;


namespace StudentManagementApi.Models
{
    public class StudentDetails
    {
        [BsonId]
        [BsonRepresentation(BsonType.ObjectId)]
        public String Id { get; set; }

        [Required]
        public String ClassName { get; set; }
        [Required]

        public String StudentName { get; set; }
        [Required]
        public String StudentID { get; set; }
        [Required]
        public String StdAddress { get; set; }


        public Nullable<System.DateTime> DateCreated { get; set; }
        public Nullable<System.DateTime> StudentBirthday { get; set; }

    }
}

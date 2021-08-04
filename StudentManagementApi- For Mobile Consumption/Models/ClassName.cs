using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace StudentManagementApi.Models
{
    public class ClassName
    {
        [BsonId]
        [BsonRepresentation(BsonType.ObjectId)]
        public String Id { get; set; }


        [Required]
        public String ClassID { get; set; }

        public Nullable<System.DateTime> DateCreated { get; set; }
    }
}

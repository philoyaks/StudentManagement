using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Practice.Models
{
    public class StudentDetails
    {
        [Key]
        public int Id { get; set; }

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

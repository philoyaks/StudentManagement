using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Practice.Models
{
    public class ClassName
    {
        [Key]
        public int Id { get; set; }


        [Required]
        public String ClassID { get; set; }

        public Nullable<System.DateTime> DateCreated { get; set; }
    }
}

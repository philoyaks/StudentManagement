using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace StudentManagementApi.Models
{
    public class StudentManagementSettings : IStudentManagementSettings
    {
        public string StudentsCollectionName { get; set; }
        public string ClassCollectionName { get; set; }
        public string DatabaseName { get; set; }
        public string ConnectionString { get; set; }
    }

    public interface IStudentManagementSettings
    {
        string StudentsCollectionName { get; set; }

        string ClassCollectionName { get; set; }

        string ConnectionString { get; set; }
        string DatabaseName { get; set; }
    }
}

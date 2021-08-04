using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using StudentManagementApi.Models;

namespace StudentManagementApi.Data
{
    public interface IRepo
    {
        //Create DataBase
        Task CreateNewClass(ClassName cn);
        Task CreateStudentDetails(StudentDetails sd);
        //delete
        Task DeleteClass(String id);

        //DeleteStudentDetails
        Task DeleteStudentDetails(String id);

        //GetStudentDetails
        IEnumerable<StudentDetails> GetStudentDetails();

        //Gets the class name of Class
        IEnumerable<ClassName> GetClassNames();

        //Get Specic Details of Students
        IEnumerable<StudentDetails> GetSpecificStudentDetails(String ClassName);

        //Get Edit Student Details
        Task EditStudentDetails(String id, StudentDetails sd);

        //Finds Student Details
        Task<StudentDetails> FindStudentDetails(String id);

        //Orders student Details
        IEnumerable<StudentDetails> OrderBYDSC();

        //Order Student names in Asecnding Order
        IEnumerable<StudentDetails> OrderBYASC();

        //Order Students names in Decensding order
        IEnumerable<StudentDetails> Search(String searchString);


    }
}

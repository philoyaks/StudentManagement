using Practice.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Practice.Data.Repository
{
    public interface IRepo
    {
        //Create DataBase
        Task CreateNewClass(ClassName cn);
        Task CreateStudentDetails(StudentDetails sd);
        //delete
        Task DeleteClass(int id);
        Task DeleteStudentDetails(int id);
        IEnumerable<StudentDetails> GetStudentDetails();


        IEnumerable<ClassName> GetClassNames();

        IEnumerable<StudentDetails> GetSpecificStudentDetails(String ClassName);
        Task EditStudentDetails(int id, StudentDetails sd);

        Task<StudentDetails> FindStudentDetails(int id);

        IEnumerable<StudentDetails> OrderBYDSC();

        IEnumerable<StudentDetails> OrderBYASC();
        IEnumerable<StudentDetails> Search(String searchString);






    }
}

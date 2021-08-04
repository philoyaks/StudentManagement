using Practice.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Practice.Data.Repository
{
    public class Repo : IRepo
    {
        private readonly AppDbContext _db;
        public Repo(AppDbContext db)
        {
            _db = db;
        }
        public async Task CreateNewClass(ClassName cn)
        {
            try
            {
                await _db.ClassNames.AddAsync(cn);
                await _db.SaveChangesAsync();
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }
        }

        public async Task CreateStudentDetails(StudentDetails sd)
        {
            try
            {
                await _db.StudentDetails.AddAsync(sd);
                await _db.SaveChangesAsync();
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }

        }

        public async Task DeleteClass(int id)
        {
            try
            {
                var taskFound = await _db.ClassNames.FindAsync(id);
                var taskFound2 = _db.StudentDetails.Where(m => m.ClassName == taskFound.ClassID);

                foreach (var item in taskFound2)
                {
                    _db.Remove(item);
                }
                _db.Remove(taskFound);

                await _db.SaveChangesAsync();
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }
        }

        public async Task DeleteStudentDetails(int id)
        {
            try
            {
                var taskFound = await _db.StudentDetails.FindAsync(id);
                _db.Remove(taskFound);
                await _db.SaveChangesAsync();
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }
        }

        public IEnumerable<ClassName> GetClassNames()
        {
            var x = _db.ClassNames.ToList();
            return x;
        }

        public IEnumerable<StudentDetails> GetSpecificStudentDetails(string ClassName)
        {
            var y = _db.StudentDetails.Where(m => m.ClassName == ClassName);
            return y;

        }

        public IEnumerable<StudentDetails> GetStudentDetails()
        {
            var y = _db.StudentDetails.ToList();
            return y;
        }

        public IEnumerable<StudentDetails> OrderBYASC()
        {
            return _db.StudentDetails.OrderBy(c => c.ClassName).ToList();
        }

        public IEnumerable<StudentDetails> OrderBYDSC()
        {
            return _db.StudentDetails.OrderByDescending(c => c.ClassName).ToList();
        }




        public async Task EditStudentDetails(int id, StudentDetails sd)
        {
            _db.StudentDetails.Update(sd);
            await _db.SaveChangesAsync();
        }

        public IEnumerable<StudentDetails> Search(String searchString)
        {
            var x = _db.StudentDetails.Where(x => x.StudentName.Contains(searchString));
            return x;
        }

        public async Task<StudentDetails> FindStudentDetails(int id)
        {
            return await _db.StudentDetails.FindAsync(id);
        }

    }
}


using MongoDB.Bson;
using MongoDB.Driver;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using StudentManagementApi.Models;
using Microsoft.Extensions.Configuration;

namespace StudentManagementApi.Data
{
    public class Repo : IRepo
    {
        private readonly IMongoCollection<StudentDetails> _studentCollection;
        private readonly IMongoCollection<ClassName> _classCollection;
        private readonly IMongoCollection<Users> _userCollection;
        private IConfiguration configuration;

        public Repo(IConfiguration config)
        {
            configuration = config;

            string url = configuration.GetSection("Connection").GetSection("url").Value;
            var settings = MongoClientSettings.FromConnectionString(url);
            var client = new MongoClient(settings);
            var database = client.GetDatabase("studentDb");
            _studentCollection = database.GetCollection<StudentDetails>("students");
            _classCollection = database.GetCollection<ClassName>("classes");
            _userCollection = database.GetCollection<Users>("Users");
        }


        public async Task CreateNewClass(ClassName cn)
        {
            await _classCollection.InsertOneAsync(cn);
        }

        public async Task CreateStudentDetails(StudentDetails sd)
        {
            await _studentCollection.InsertOneAsync(sd);
        }


        public async Task DeleteClass(string id)
        {
            var result = _classCollection.Find(c => c.ClassID == id).First();
            await _studentCollection.DeleteManyAsync(x => x.ClassName == result.ClassID);
            await _classCollection.DeleteOneAsync(x => x.ClassID == id);
        }

        public async Task DeleteStudentDetails(string id)
        {
            await _studentCollection.DeleteOneAsync(x => x.Id == id);

        }

        public IEnumerable<StudentDetails> GetStudentDetails()
        {
            return _studentCollection.Find(x => true).ToList();

        }


        public IEnumerable<ClassName> GetClassNames()
        {
            return _classCollection.Find(x => true).ToList();
        }

        public IEnumerable<StudentDetails> GetSpecificStudentDetails(string ClassName)
        {
            return _studentCollection.Find(x => x.ClassName == ClassName).ToList();
        }

        public async Task EditStudentDetails(string id, StudentDetails sd)
        {
            await _studentCollection.ReplaceOneAsync(x => x.Id == id, sd);

        }

        public async Task<StudentDetails> FindStudentDetails(string id)
        {
            var result = await _studentCollection.FindAsync<StudentDetails>(x => x.Id == id);
            return result.FirstOrDefault();
        }

        public IEnumerable<StudentDetails> OrderBYDSC()
        {

            return _studentCollection.Find(x => true).SortByDescending(x => x.StudentName).ToList();
        }

        public IEnumerable<StudentDetails> OrderBYASC()
        {
            return _studentCollection.Find(x => true).SortBy(x => x.StudentName).ToList();
        }

        public IEnumerable<StudentDetails> SearchForStudents(string searchString)
        {
            //Student name loockup
            var x = _studentCollection.Find(x => x.StudentName.Contains(searchString)).SortBy(x => x.StudentName).ToList();
            return x;
        }

        public async Task<Users> CreateUser(Users user)
        {
            await _userCollection.InsertOneAsync(user);
            Users users = await GetUser(user.SchoolEmail, user.Password);
            return users;

        }

        public async Task<Users> GetUser(string email, string password)
        {
            var result = await _userCollection.FindAsync<Users>(x => x.SchoolEmail == email && x.Password == password);
            return result.FirstOrDefault();
        }

        public async Task<List<Users>> GetAllUsers()
        {
            var result = await _userCollection.FindAsync<Users>(x => true).Result.ToListAsync();
            return result;
        }
    }
}

﻿using System;
using System.Collections.Generic;
using Microsoft.AspNetCore.Identity;

namespace eKlinika.Model
{
    public class Korisnici_Base
    {
        public int Id { get; set; }
        public string UserName { get; set; }
        public string PhoneNumber { get; set; }
        public string Email { get; set; }
        public DateTime DatumRodjenja { get; set; }
        //public int? GradId { get; set; }
        public string Ime { get; set; }
        public string Prezime { get; set; }
        public string JMBG { get; set; }
        public byte[] Slika { get; set; }
        public string Spol { get; set; }
        public string Ulica { get; set; }
        
    }
}

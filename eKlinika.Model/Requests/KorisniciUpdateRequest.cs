﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace eKlinika.Model.Requests
{
    public class KorisniciUpdateRequest
    {
        [Required(AllowEmptyStrings = false)]
        public string PhoneNumber { get; set; }
        [Required(AllowEmptyStrings = false)]
        public string UserName { get; set; }

        [Required(AllowEmptyStrings = false)]
        public string Ime { get; set; }
        [Required(AllowEmptyStrings = false)]
        public string Prezime { get; set; }
        [EmailAddress]
        [Required]
        [MinLength(5)]
        public string Email { get; set; }
        public string Password { get; set; }
        public string PasswordPotvrda { get; set; }

        public int? GradId { get; set; }
        public Osoblje Osoblje { get; set; }
        public Pacijent Pacijent { get; set; }

        public List<int> Uloge { get; set; } = new List<int>();
    }
}

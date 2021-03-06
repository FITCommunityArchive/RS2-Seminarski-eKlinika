﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using eKlinika.Model.Requests;
using eKlinika.WebAPI.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace eKlinika.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [Authorize]
    [ApiController]
    public class NarudzbaStavkaController : ControllerBase
    {
        private readonly INarudzbaStavkaService _service;
        public NarudzbaStavkaController(INarudzbaStavkaService service)
        {
            _service = service;
        }

        [Authorize(Roles = "Administrator,Apotekar")]
        [HttpGet]
        public List<Model.NarudzbaStavka> Get([FromQuery]NarudzbaStavkaSearchRequest request)
        {
            return _service.Get(request);
        }

        [Authorize(Roles = "Administrator,Apotekar")]
        [HttpPost]
        public Model.NarudzbaStavka Insert(NarudzbaStavkaInsertRequest request)
        {
            return _service.Insert(request);
        }

        [Authorize(Roles = "Administrator,Apotekar")]
        [HttpPut("{id}")]
        public Model.NarudzbaStavka Update(int id, [FromBody]NarudzbaStavkaInsertRequest request)
        {
            return _service.Update(id, request);
        }

        [Authorize(Roles = "Administrator,Apotekar")]
        [HttpGet("{id}")]
        public Model.NarudzbaStavka GetById(int id)
        {
            return _service.GetById(id);
        }
    }
}
<h1 align="center">Exibição de exames clínicos em JSON originados de um arquivo CSV</h1>
<p align="center"> Essa API popula o banco de dados por meio de um arquivo CSV e exibe os registros em JSON.</p>

<div align='center' id="tecnologias">
  <img src="https://img.shields.io/static/v1?label=Container&message=Docker&color=7159c1&style=for-the-badge&logo=Docker"/>
  <img src="https://img.shields.io/static/v1?label=Library's&message=Sinatra/puma&color=7159c1&style=for-the-badge&logo=Ruby"/>
  <img src="https://img.shields.io/static/v1?label=Database&message=Postgresql&color=7159c1&style=for-the-badge&logo=PostgreSQL"/>
</div>

--------------

<h2 id="project-setup">Setup do projeto</h2>

```bash
$ 
```

--------------

<h2 id="api" align="left">API</h2>


Request:
```bash
GET /tests/T9O6AI
```

Response:

```json
{
   "result_token":"T9O6AI",
   "result_date":"2021-11-21",
   "cpf":"066.126.400-90",
   "name":"Matheus Barroso",
   "email":"maricela@streich.com",
   "birthday":"1972-03-09",
   "doctor": {
      "crm":"B000B7CDX4",
      "crm_state":"SP",
      "name":"Sra. Calebe Louzada"
   },
   "tests":[
      {
         "test_type":"hemácias",
         "test_limits":"45-52",
         "result":"48"
      },
      {
         "test_type":"leucócitos",
         "test_limits":"9-61",
         "result":"75"
      },
      {
         "test_type":"plaquetas",
         "test_limits":"11-93",
         "result":"67"
      },
      {
         "test_type":"hdl",
         "test_limits":"19-75",
         "result":"3"
      },
      {
         "test_type":"ldl",
         "test_limits":"45-54",
         "result":"27"
      },
      {
         "test_type":"vldl",
         "test_limits":"48-72",
         "result":"27"
      },
      {
         "test_type":"glicemia",
         "test_limits":"25-83",
         "result":"78"
      },
      {
         "test_type":"tgo",
         "test_limits":"50-84",
         "result":"15"
      },
      {
         "test_type":"tgp",
         "test_limits":"38-63",
         "result":"34"
      },
      {
         "test_type":"eletrólitos",
         "test_limits":"2-68",
         "result":"92"
      },
      {
         "test_type":"tsh",
         "test_limits":"25-80",
         "result":"21"
      },
      {
         "test_type":"t4-livre",
         "test_limits":"34-60",
         "result":"95"
      },
      {
         "test_type":"ácido úrico",
         "test_limits":"15-61",
         "result":"10"
      }
   ]
}
```
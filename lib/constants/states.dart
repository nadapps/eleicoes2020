const states = [
  {
    "flag":
        'http://upload.wikimedia.org/wikipedia/commons/thumb/4/4c/Bandeira_do_Acre.svg/300px-Bandeira_do_Acre.svg.png',
    "abrev": 'AC',
    "name": 'Acre'
  },
  {
    "flag":
        'https://upload.wikimedia.org/wikipedia/commons/thumb/8/88/Bandeira_de_Alagoas.svg/300px-Bandeira_de_Alagoas.svg.png',
    "abrev": 'AL',
    "name": 'Alagoas'
  },
  {
    "flag":
        'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0c/Bandeira_do_Amap%C3%A1.svg/300px-Bandeira_do_Amap%C3%A1.svg.png',
    "abrev": 'AP',
    "name": 'Amapá'
  },
  {
    "flag":
        'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/Bandeira_do_Amazonas.svg/300px-Bandeira_do_Amazonas.svg.png',
    "abrev": 'AM',
    "name": 'Amazonas'
  },
  {
    "flag":
        'https://upload.wikimedia.org/wikipedia/commons/thumb/2/28/Bandeira_da_Bahia.svg/300px-Bandeira_da_Bahia.svg.png',
    "abrev": 'BA',
    "name": 'Bahia'
  },
  {
    "flag":
        'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2e/Bandeira_do_Cear%C3%A1.svg/300px-Bandeira_do_Cear%C3%A1.svg.png',
    "abrev": 'CE',
    "name": 'Ceará'
  },
  // {
  //   "flag":
  //       'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Bandeira_do_Distrito_Federal_%28Brasil%29.svg/300px-Bandeira_do_Distrito_Federal_%28Brasil%29.svg.png',
  //   "abrev": 'DF',
  //   "name": 'Distrito Federal'
  // },
  {
    "flag":
        'https://upload.wikimedia.org/wikipedia/commons/thumb/4/43/Bandeira_do_Esp%C3%ADrito_Santo.svg/300px-Bandeira_do_Esp%C3%ADrito_Santo.svg.png',
    "abrev": 'ES',
    "name": 'Espírito Santo'
  },
  {
    "flag":
        'https://upload.wikimedia.org/wikipedia/commons/thumb/b/be/Flag_of_Goi%C3%A1s.svg/200px-Flag_of_Goi%C3%A1s.svg.png',
    "abrev": 'GO',
    "name": 'Goiás'
  },
  {
    "flag":
        'https://upload.wikimedia.org/wikipedia/commons/thumb/4/45/Bandeira_do_Maranh%C3%A3o.svg/300px-Bandeira_do_Maranh%C3%A3o.svg.png',
    "abrev": 'MA',
    "name": 'Maranhão'
  },
  {
    "flag":
        'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0b/Bandeira_de_Mato_Grosso.svg/300px-Bandeira_de_Mato_Grosso.svg.png',
    "abrev": 'MT',
    "name": 'Mato Grosso'
  },
  {
    "flag":
        'https://upload.wikimedia.org/wikipedia/commons/thumb/6/64/Bandeira_de_Mato_Grosso_do_Sul.svg/300px-Bandeira_de_Mato_Grosso_do_Sul.svg.png',
    "abrev": 'MS',
    "name": 'Mato Grosso do Sul'
  },
  {
    "flag":
        'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f4/Bandeira_de_Minas_Gerais.svg/300px-Bandeira_de_Minas_Gerais.svg.png',
    "abrev": 'MG',
    "name": 'Minas Gerais'
  },
  {
    "flag":
        'https://upload.wikimedia.org/wikipedia/commons/thumb/0/02/Bandeira_do_Par%C3%A1.svg/300px-Bandeira_do_Par%C3%A1.svg.png',
    "abrev": 'PA',
    "name": 'Pará'
  },
  {
    "flag":
        'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bb/Bandeira_da_Para%C3%ADba.svg/300px-Bandeira_da_Para%C3%ADba.svg.png',
    "abrev": 'PB',
    "name": 'Paraíba'
  },
  {
    "flag":
        'https://upload.wikimedia.org/wikipedia/commons/thumb/9/93/Bandeira_do_Paran%C3%A1.svg/300px-Bandeira_do_Paran%C3%A1.svg.png',
    "abrev": 'PR',
    "name": 'Paraná'
  },
  {
    "flag":
        'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/Bandeira_de_Pernambuco.svg/300px-Bandeira_de_Pernambuco.svg.png',
    "abrev": 'PE',
    "name": 'Pernambuco'
  },
  {
    "flag":
        'https://upload.wikimedia.org/wikipedia/commons/thumb/3/33/Bandeira_do_Piau%C3%AD.svg/300px-Bandeira_do_Piau%C3%AD.svg.png',
    "abrev": 'PI',
    "name": 'Piauí'
  },
  {
    "flag":
        'https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Bandeira_do_estado_do_Rio_de_Janeiro.svg/300px-Bandeira_do_estado_do_Rio_de_Janeiro.svg.png',
    "abrev": 'RJ',
    "name": 'Rio de Janeiro'
  },
  {
    "flag":
        'https://upload.wikimedia.org/wikipedia/commons/thumb/3/30/Bandeira_do_Rio_Grande_do_Norte.svg/300px-Bandeira_do_Rio_Grande_do_Norte.svg.png',
    "abrev": 'RN',
    "name": 'Rio Grande do Norte'
  },
  {
    "flag":
        'https://upload.wikimedia.org/wikipedia/commons/thumb/6/63/Bandeira_do_Rio_Grande_do_Sul.svg/300px-Bandeira_do_Rio_Grande_do_Sul.svg.png',
    "abrev": 'RS',
    "name": 'Rio Grande do Sul'
  },
  {
    "flag":
        'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Bandeira_de_Rond%C3%B4nia.svg/300px-Bandeira_de_Rond%C3%B4nia.svg.png',
    "abrev": 'RO',
    "name": 'Rondônia'
  },
  {
    "flag":
        'https://upload.wikimedia.org/wikipedia/commons/thumb/9/98/Bandeira_de_Roraima.svg/300px-Bandeira_de_Roraima.svg.png',
    "abrev": 'RR',
    "name": 'Roraima'
  },
  {
    "flag":
        'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1a/Bandeira_de_Santa_Catarina.svg/300px-Bandeira_de_Santa_Catarina.svg.png',
    "abrev": 'SC',
    "name": 'Santa Catarina'
  },
  {
    "flag":
        'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2b/Bandeira_do_estado_de_S%C3%A3o_Paulo.svg/300px-Bandeira_do_estado_de_S%C3%A3o_Paulo.svg.png',
    "abrev": 'SP',
    "name": 'São Paulo'
  },
  {
    "flag":
        'https://upload.wikimedia.org/wikipedia/commons/thumb/b/be/Bandeira_de_Sergipe.svg/300px-Bandeira_de_Sergipe.svg.png',
    "abrev": 'SE',
    "name": 'Sergipe'
  },
  {
    "flag":
        'https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/Bandeira_do_Tocantins.svg/300px-Bandeira_do_Tocantins.svg.png',
    "abrev": 'TO',
    "name": 'Tocantins'
  }
];

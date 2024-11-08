use sirio;

select u.* from sirio.usuario u;

select e.* from endereco e;

select u.id
     , u.uuid
     , u.cpf
     , u.nome
     , e.rua
     , e.numero
     , e.cep
     , u.status
    from sirio.usuario u
        , sirio.endereco e
  where u.endereco_id = e.id
    and u.status = true;
USE garden;

INSERT INTO gama_productos VALUES ('gama01', 'daes', 'center di(', 'imagen.png');
INSERT INTO gama_productos VALUES ('gama02', 'daeh', 'center di5', 'imagen.pngg');
INSERT INTO gama_productos VALUES ('gama03', 'daej', 'center di3', 'imagen.pnggg');
INSERT INTO gama_productos VALUES ('gama04', 'daew', 'center dim', 'imagen.pngggg');
INSERT INTO gama_productos VALUES ('gama05', 'daek', 'center did', 'imagen.pnggggg');
INSERT INTO gama_productos VALUES ('gama06', 'daed', 'center diw', 'imagen.pngggggg');
INSERT INTO gama_productos VALUES ('gama07', 'daep', 'center dia', 'imagen.pnggggggg');

INSERT INTO productos VALUES ('cod001', 'nombre01', 'gama01', '1x1x1', 'cocacola', 'desc02', 1, 320, 260);
INSERT INTO productos VALUES ('cod002', 'nombre02', 'gama02', '1x1x2', 'pepsi', 'desc03', 2, 304, 210);
INSERT INTO productos VALUES ('cod003', 'nombre03', 'gama02', '1x2x1', 'whuaheri', 'desc04', 3, 303, 350);
INSERT INTO productos VALUES ('cod004', 'nombre04', 'gama03', '3x1x1', 'samsung', 'desc05', 4, 301, 750);
INSERT INTO productos VALUES ('cod005', 'nombre06', 'gama04', '2x1x1', 'amongus', 'desc06', 5, 307, 260);
INSERT INTO productos VALUES ('cod006', 'nombre07', 'gama05', '3x2x1', 'cimpumax', 'desc07', 6, 309, 950);
INSERT INTO productos VALUES ('cod007', 'nombre05', 'gama07', '1x3x1', 'scriube', 'desc08', 7, 380, 260);
INSERT INTO productos VALUES ('cod008', 'nombre08', 'gama06', '1x1x5', 'LG', 'desc09', 8, 370, 258);
INSERT INTO productos VALUES ('cod009', 'nombre09', 'gama01', '1x5x6', 'NVIDIA', 'desc10', 9, 340, 450);

INSERT INTO oficinas VALUES ('01', 'bga', 'col', 'thing', '1356', '5631232', '[0hgq8uhq]', 'yhifgvbdsahi');
INSERT INTO oficinas VALUES ('02', 'bgf', 'c0l', 'some', '11025456', '684351', ';lksaf', '9874yh4tj');
INSERT INTO oficinas VALUES ('03', 'bgp', 'cll', 'soasng', '113256', '53415', 'akjreg', '8uyh4t');
INSERT INTO oficinas VALUES ('04', 'bgy', 'cal', 'someafsdgkjthing', '5645110456', '123556132', 'iu4nrg', 'iu4wt');
INSERT INTO oficinas VALUES ('05', 'bgb', 'cyl', 'sodjjthing', '11', '1533451', 'iu42hoir', ';sakjgba');

INSERT INTO empleados VALUES (01, 'juan', 'pardo', 'garcia', 'extenso', 'google@gmail.com', '01', 32, 'jefe jefe') ;
INSERT INTO empleados VALUES (02, 'juanxJuan', 'pardon´t', 'garcian´t', 'y mucho', 'pardo@gmail.com', '02', 322, 'es muy jefe') ;
INSERT INTO empleados VALUES (03, 'juansito', 'pardooooo', 'garciaaaaa', 'no tanto', 'yahoo@gmail.com', '03', 3872, 'no es jefe') ;
INSERT INTO empleados VALUES (04, 'juansote', 'killer', 'man', 'un tris', 'hotmail@gmail.com', '04', 4, 'tan jefe') ;
INSERT INTO empleados VALUES (05, 'juanaaaa', 'amo', 'sql', 'extensote', 'campuslandos@gmail.com', '05', 96, 'jefe') ;

INSERT INTO clientes VALUES (01, 'jholver', 'pardo', '3', '1323123', 'fgdserigs', 'srtgrfed', 'bga', 'colombia', 'america', '2131', 01, 1000);
INSERT INTO clientes VALUES (02, 'jholversito', 'pardito', '45632452453', '456555', 'sdfsdf', 'ssdaw435a3w5fgsfdg', 'cali', 'denmakr', 'asia', '3452', 02, 8000);
INSERT INTO clientes VALUES (03, 'jholver2', 'pardote', '78763', '2345', 'vvbxfg', 'g35y', 'no cali', 'antatica', 'odecania', '4358', 03, 6000);
INSERT INTO clientes VALUES (04, 'jholverx4', 'pardo_leon', '4587763', '678', 'wyterty', 'safgoihwrthrwhafd', 'newyprk', 'peru', 'america2', '7809', 04, 2000);
INSERT INTO clientes VALUES (05, 'killer', 'annihilator', '446545563', '654356', 'hfgh', 'cxyhfgy', 'london', 'colombian´t', 'yuropa', '567587', 05, 9000);

INSERT INTO pedidos VALUES (001, '2008-11-16', '2008-05-11', '2008-11-11', 'activo papi', 'mucho texto', 01);
INSERT INTO pedidos VALUES (002, '2008-11-15', '2008-03-11', '2004-11-11', 'dormido', 'buen video bro', 02);
INSERT INTO pedidos VALUES (003, '2008-11-17', '2008-04-11', '2005-11-11', 'jugando', 'me yallmo andrey', 03);
INSERT INTO pedidos VALUES (004, '2008-11-10', '2008-08-11', '2006-11-11', 'en recorrido', 'yo soy iohasda', 04);
INSERT INTO pedidos VALUES (005, '2008-11-12', '2008-09-11', '2007-11-11', 'no recorriendo', 'amo a sql mucho', 05);

INSERT INTO detalle_pedido VALUES (001, 'cod001', 101, 10, 1);
INSERT INTO detalle_pedido VALUES (002, 'cod004', 103, 50, 2);
INSERT INTO detalle_pedido VALUES (003, 'cod002', 102, 60, 3);
INSERT INTO detalle_pedido VALUES (004, 'cod003', 104, 70, 4);
INSERT INTO detalle_pedido VALUES (005, 'cod005', 105, 80, 5);

INSERT INTO pagos VALUES (01, 'tarjeta', '00010', '2009-01-01', 3000);
INSERT INTO pagos VALUES (02, 'tarjeta', '00013', '2009-01-02', 3500);
INSERT INTO pagos VALUES (03, 'credito', '00070', '2001-01-03', 4000);
INSERT INTO pagos VALUES (04, 'efectivo', '00014', '2008-01-04', 4500);
INSERT INTO pagos VALUES (05, 'no tarjeta', '00030', '2007-01-05', 5000);
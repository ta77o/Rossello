
///ACTUALIZACIONES 01-11-18 10:30
///SE INCORPORO EL LOGGIN CON VALIDACION DE USUARIO, SALIDAS POR EXCESO DE FAIL, SE DIAGRAMO LA MATRIZ CON 6 REGISTROS INICIALES,
///SE COMPLETAN CON 0 LOS REGISTROS DE 6 EN ADELANTE
/// LAS VARIABLES SON matrizusuarios, MATRIZCAJA, nombsucursal,ii
///MATRIZUSUARIOS CONTIENE LOS REGISTROS DE ADMINISTRADOR Y USUARIO Y UN VALOR INDICE EL CUAL IDENTIFICA EL NIVEL DE USUARIO
///MATRIZCAJA CONTIENE EN TIPO CARACTER EL VALOR DE LA SUCURSAL, FECHA Y CAJA DE ESA FECHA.
///el vector ii indica los registros de cada matriz, 0 para matrizcaja, 1 para nombresucursal, 3 para matrizusuarios

///ACTUALIZACIONES 01-11-18 10:58
///EL VALOR DE USUARIO ES CARACTER ASI QUE SE CONVIERTE CON LA FUNCION CONVERTIR A NUMERO Y SE GUARDA EN USUARIONUM






///SUBPROCESO DE LOGGUEO
SubProceso perfil<-LOGGUEO(MATUSU) // EL PARAMETRO MATUSU LLAMA A LA MATRIZ MARIZUSUARIOS
	definir perfil como caracter;
	DEFINIR usuario, CLAVE Como Caracter; // SERA EL VALOR DE INGRESO PARA COMPARAR CON USUARIOS
	DEFINIR I, INDICE, fail, VALORINDICE COMO ENTERO;
	DEFINIR ENCONTRADO, CLAVEOK COMO LOGICO;
	ENCONTRADO<-FALSO;
	CLAVEOK<-FALSO;
	FAIL<-0;
	
	Repetir
		Repetir // SE REPITE HASTA QUE EL USUARIO SEA DISTINTO DE VACIO
			ESCRIBIR "INGRESE SU USUARIO";
			LEER USUARIO;
			SI USUARIO = "" Entonces
				ESCRIBIR "EL USUARIO NO PUEDE SER VACIO";
				///ERROR QUE SE PUEDE PRESENTAR "USUARIO VACIO"
				
			FinSi
		Hasta Que USUARIO <> ""
		
		PARA I<-0 HASTA 1 CON PASO 1 HACER // COMPARA USUARIO CON EL CADA VALOR EN EL PRIMER PARAMETRO QUE ES USUARIO
			// HASTA ENCONTRAR EL PRIMERO
			SI USUARIO = MATUSU(I,0) ENTONCES
				ENCONTRADO<-VERDADERO; // SI ES ENCONTRADO SE DEVUELVE EL VALOR VERDADERO PARA ENCONTRADO
				indice<-I;
				I<-5;//AL ENCONTRARLO LLEVA EL VALOR DE I HASTA EL FINAL MAS 1 PARA CERRAR EL CICLO
			FinSi
		FinPara
		
		SI ENCONTRADO=Falso Entonces // PARA EL VALOR ENCONTRADO FALSO ENTONCES ESCRIBE EN PANTALLA Y TERMINA EL CONDICIONAL
			ESCRIBIR "USUARIO NO ENCONTRADO";
			///ERROR QUE SE PUEDE PRESENTAR "ERROR EN USUARIO"
			fail<-fail+1;// SUMA 1 A FAIL Y AL LLEGAR A 3 ENTONCES CIERRA EL REPETIR CON EL USUARIO BANNEADO
			si fail=3 entonces 
				escribir "TERCER ERROR DE INGRESO DE USUARIO. SERA BANEADO";
				///ERROR QUE SE PUEDE PRESENTAR "3 ERRORES CONSECUTIVOS DE USUARIO"
			FinSi
		SiNo
			fail<-0; //REINICIA EL CONTADOR DE FAIL PARA COMPROBAR LA CLAVE
			REPETIR
				ESCRIBIR "INGRESE CLAVE DE USUARIO";
				leer clave;
				si clave = MATUSU(indice,1) entonces//COMPRUEBA QUE CLAVE SEA IGUAL AL PARAMETRO 1 DEL MISMO INDICE YA INDICADO 
					
					claveok<-verdadero;//CIERRA EL CONDICIONAL AL SER VERDADERO
				SiNo
					fail<-fail+1;
					SI FAIL = 3 ENTONCES
						ESCRIBIR "TERCER ERROR, SERÁ BANNEADO";// AL TERCER ERROR DE CLAVE ES BANEADO
						///ERROR QUE SE PUEDE PRESENTAR "ERROR DE CLAVE EN USUARIO VALIDO"
					SiNo
						escribir "ERROR ", FAIL, ", INGRESE LA CLAVE CORRECTA";	//INDICA QUE HUBO UN ERROR DE CLAVE
						///ERROR QUE SE PUEDE PRESENTAR "3 ERRORES DE CLAVE EN USUARIO VALIDO"
					FinSi
					
					
				FinSi
				
			Hasta Que CLAVEOK = Verdadero o fail=3
			
		FinSi
		
		
	Hasta Que encontrado=verdadero o fail=3
	
	SI CLAVEOK =Verdadero ENTONCES //AL CERRARSE EL CONDICIONAL TOMA DECICION SOBRE SI ES CLAVEOK O FAIL =3 
		ESCRIBIR "ACCESO EXITOSO, BIENVENIDO ", MATUSU(INDICE,0); //ACCESO EXITOSO, IMPRIME EL NOMBRE DE USUARIO, 
		//SEGUNDO PARAMETRO VALOR 0
		perfil<-matusu(indice,2); //VALORINDICE TOMA EL VALOR DE INDICE QUE SERA EL NRO DE USUARIO
	SINO 
		perfil<-"100"; //EN CASO DE QUE HAYA HABIDO EXCESO DE FAIL  VALORINDICE VALDRA 100 PARA DETERMINAR QUE NO 
		// SE PUEDE INGRESAR AL SISTEMA
	FinSi
	
	
	
FinSubProceso
/// FIN DE PROCESO DE LOGGUEO

//--------------------------------------------------
/// INICIO LLENADO DE MATRIZ
//Modulo para cargar datos a "memoria" 
Funcion llenador(matrizusuarios por referencia, matrizcaja Por Referencia, nombsucursal Por Referencia,cantreg Por Referencia)    //llena datos en las matrices (esto deberia ser leido de archivos...pero bueno.
	Definir n como entero;
	
	matrizcaja[0,0]<-1;	matrizcaja[0,1]<-170112;	matrizcaja[0,2]<-18000;	
	matrizcaja[1,0]<-2;	matrizcaja[1,1]<-170112;	matrizcaja[1,2]<-22000;	
	matrizcaja[2,0]<-3;	matrizcaja[2,1]<-180604;	matrizcaja[2,2]<-39000; 	
	matrizcaja[3,0]<-1;	matrizcaja[3,1]<-190330;	matrizcaja[3,2]<-47000;	
	matrizcaja[4,0]<-2;	matrizcaja[4,1]<-190330;	matrizcaja[4,2]<-53000;	
	matrizcaja[5,0]<-3;	matrizcaja[5,1]<-190330;	matrizcaja[5,2]<-62000;
	
	
	//llena de 0 los restantes registros de la matriz, en columna 0, columna 1, columna 2
	//para n <-6 hasta 199 con paso 1 Hacer
	//	matrizcaja(n,0)<-0;
	//FinPara
	//para n <-6 hasta 199 con paso 1 Hacer
	//	matrizcaja(n,1)<-0;
	//FinPara
	//para n <-6 hasta 199 con paso 1 Hacer
	//	matrizcaja(n,2)<-0;
	//FinPara
	
	cantreg[0]<-6;
	nombsucursal[0,0]<-'casita'; nombsucursal[0,1]<-'1'; 
	nombsucursal[1,0]<-'laburo'; nombsucursal[1,1]<-'2';
	nombsucursal[2,0]<-'regalo'; nombsucursal[2,1]<-'3';
	nombsucursal[3,0]<-'puente'; nombsucursal[3,1]<-'4';
	
	cantreg[1]<-4;
	matrizusuarios(0,0)<-"admin"; matrizusuarios(0,1)<-"1234"; matrizusuarios(0,2)<-"administrador";
	matrizusuarios(1,0)<-"usuario"; matrizusuarios(1,1)<-"1234"; matrizusuarios(1,2)<-"usuario";
	
	cantreg[2]<-2;

	
	
FinFuncion
///validador de opcion
subproceso opcion<-validarop()
	definir opmenu como caracter;
	definir opcion como numero;
	opcion<-10;
	leer opmenu;
	
	si opmenu="0" o opmenu="1" o opmenu="2" o opmenu="3" o opmenu="4" o opmenu="5" o opmenu="6" o opmenu="7" o opmenu="8" o opmenu="9" entonces
		opcion<-convertiranumero(opmenu);
	sino 
		escribir "ingrese opcion valida";
	FinSi
	
FinSubProceso

///fin validar opciones

///menu
Funcion salida<-menu(usuario por valor,matrizcaja Por Referencia,matrizusuarios Por Referencia,matrizsucursal Por Referencia,cantreg Por Referencia,nombsucursal por referencia)
	definir salida como numero;
	definir opcion como numero;
	definir limiteopciones como numero;
	
	escribir ' ';
	escribir 'Seleccione la opcion deseada';
	escribir ' ';
	escribir '1:   Ver todos los registros de caja'        ;
	escribir '2:   Ver todos los asignaciones de sucursales';
	escribir '3:   Buscar registros de una sucursal';
	escribir '4:   añadir una entrada de caja diaria';
	
	limiteopciones<-4;
	si usuario="administrador" entonces
		
		escribir '5:   Ver todos los usuarios y contraseñas';           
		escribir '6:   borrar un registro de caja';
		limiteopciones<-6;//indica las cantidad de opciones que hay
	FinSi
	escribir '0:   Salir ';
	
	
	
	repetir 
		opcion<-validarop();
	Hasta Que opcion<=limiteopciones //cuando el numero que se genero es mayor que la cantidad de opciones se vuelve a repetir
	
	
	
	
	Segun opcion Hacer
		1:
			mostrarcaja(matrizcaja,cantreg);
			// para pedir todos los registros de caja diaria  
		2:
			mostrarsucursal(cantreg,nombsucursal);
			
			// para pedir todos los registros de sucursales
		3:
			buscarsucursal(matrizcaja,cantreg);
			
			// para pedir todos los registros de una sola sucursal
		4:
			escribircaja(matrizcaja,cantreg);
			// para escribir una entrada de registro de caja diaria
			
		5:
			muestrausuarios(matrizusuarios,cantreg);
			
			// para pedir todos los registros de usuarios
		6:
			borrarregistrocaja(matrizcaja,cantreg);
			
			//para borrar una entrada de registro de la caja diaria
		0:
			escribir "selecciono salir, gracias por usar pingosoftware";
		De Otro Modo:
			escribir 'ingrese una opcion valida forroo';
			esperar tecla;
			borrar pantalla;
	FinSegun
	esperar tecla;
	salida<-opcion;
FinFuncion

///fin menu




///muestra todos los valores de caja
subproceso mostrarcaja(matrizcaja por referencia,cantreg por referencia)
	definir i, j como numero;
	// muestra la matriz de registros de caja diaria
	Para i<-0 Hasta (cantreg(0)-1 ) Con Paso 1 Hacer
		Para j<-0 Hasta 2 Con Paso 1 Hacer
			escribir matrizcaja[i,j],' '  Sin Saltar ; // sin saltar de otra manera solo muestra todo en una columna
		FinPara
		escribir ' '; // esto es para que solo haga un "enter"
	FinPara
	escribir ' '; 
	
FinSubProceso
///fin mostrar valores de caja
///mostrar todos los valores de sucursal
Subproceso mostrarsucursal(cantreg por referencia,nombsucursal por referencia)
	definir i, j como numero;
	
	// muestra la matriz de sucursales
	Para i<-0 Hasta cantreg[1]-1 Con Paso 1 Hacer
		Para j<-0 Hasta 1 Con Paso 1 Hacer
			escribir nombsucursal[i,j],' '  Sin Saltar;  // sin saltar de otra manera solo muestra todo en una columna
		FinPara
		escribir ' '; // esto es para que solo haga un "enter"
	FinPara
	escribir ' '; 
	
	
FinSubProceso

///fin mostrar valores de sucursal

///mostrar todos los usuarios
Subproceso muestrausuarios(matrizusuarios por referencia,cantreg por referencia)
	definir i, j como numero;
	// muestra la matriz de sucursales
	Para i<-0 Hasta cantreg[2]-1 Con Paso 1 Hacer
		Para j<-0 Hasta 2 Con Paso 1 Hacer
			escribir matrizusuarios[i,j],' '  Sin Saltar;  // sin saltar de otra manera solo muestra todo en una columna
		FinPara
		escribir ' '; // esto es para que solo haga un "enter"
	FinPara
	escribir ' '; 
FinSubProceso
///fin mostrar todos los usuarios


///mostrar todos los valores de una sola sucursal
Funcion buscarsucursal(matrizcaja Por Referencia,cantreg Por Referencia)   //busca el valor v en la matriz de registros de caja diaria y lo muestra
	definir opsucursal,i,j como numero;
	
	// devuelve a z la fila que da la ultima coincidencia   	z<-0; //		si no se halla nada el resultado de z es 0
	
	
	opsucursal<-validadorsucursal(matrizsucursal,cantreg);//con esto seleccionara la sucursal a mostrar
	
	
	Para i<-0 Hasta cantreg[0]-1 Con Paso 1 Hacer
		Si matrizcaja[i,0]=opsucursal Entonces
			// esto causa que el ultimo numero de fila encontrado sea el resultado de la funcion
			escribir " encontrado en posicion ",i+1; //le sumo 1 porque los indices arrancan en 0
			Para j<-0 Hasta 2 Con Paso 1 Hacer
				escribir matrizcaja[i,j],' '  Sin Saltar;  // sin saltar de otra manera solo muestra todo en una columna
			FinPara
			escribir ' '; // esto es para que solo haga un "enter"
		FinSi	
	FinPara
FinFuncion

SubProceso opsucursal<-validadorsucursal(matrizsucursal Por Referencia,cantreg Por Referencia)
	definir i como numero;
	definir opsucursal como numero;
	opsucursal<- -1;
	repetir
		escribir "seleccione una sucursal";
		leer opsucursal;//no uso el validador por que el valor de sucursal podria ser mayor que 9 y no funciona
		//mas vale que introduzca valores numericos
		
		
		
		
		si opsucursal>=cantreg(1) Entonces
			escribir "seleccione una opciones valida";
		FinSi
	Hasta Que opsucursal<cantreg(1) y opsucursal>0
	
FinSubProceso





///fin mostrar valores de una sola sucursal

///ingreso de valores en caja
Funcion escribircaja(matrizcaja por referencia,cantreg Por Referencia)// añade un registro de caja diaria
	definir i, opsucursal,ff, dd, mm,aa,cad como numero;
	definir aprobado como logico;
	aprobado<-falso;
	
	
	i<-cantreg[0]; //para escribir en la ultima linea
	cantreg[0]<-i+1;// para incrementar el tamaño de los registros
	
	
	opsucursal<-validadorsucursal(matrizsucursal,cantreg);
	matrizcaja(i,0)<-opsucursal;
	aa<-101;
	mm<-101;
	dd<-101;
	Repetir
		escribir ' Introducir año (dos ultimos digitos)';
		leer aa;	
	Hasta Que aa<100 y aa>=0
	
	repetir 
		escribir ' Introducir mes';
		leer mm;	
	Hasta Que mm<13 y mm >0
	
	//condicionales para el dia, si tiene 30 o 31, febrero o si es bisiesto
	Repetir
		escribir ' Introducir dia';
		leer dd; 
		
		si dd>0 y dd<29 Entonces
			aprobado<-Verdadero;
		SiNo
			si dd=29 y mm=2 y aa%4=0 Entonces //los años divisibles por 4 son los bisiestos
				aprobado<-verdadero;
			SiNo
				si dd<31 y (mm=4 o mm=6 o mm=9 o mm=11) Entonces
					aprobado<-verdadero;
				SiNo
					si dd<32 y (mm=1 o mm=3 o mm=5 o mm=7 o mm=8 o mm=10 o mm=12) Entonces
						aprobado<-verdadero;	
					SiNo
						escribir "ingrese dia valido";
					FinSi
				 
					
				FinSi
			FinSi
		FinSi
		
		
	Hasta Que aprobado=Verdadero
	
	
	ff<-aa*10000+mm*100+dd; matrizcaja(i,1)<-ff;  //  año mes y dia a un solo valor aammdd
	escribir ' Introducir valor caja diaria';
	leer cad; matrizcaja(i,2)<-cad;
	
	
FinFuncion

///fin de ingreso de valores en caja

///inicio borrar valores de caja
Funcion borrarregistrocaja(matrizcaja Por Referencia,cantreg Por Referencia)  
	definir posicion_paraborrar,i,j como numero;
	
	Repetir
		escribir "ingrese posicion para borrar";
		leer posicion_paraborrar;
		
	Hasta Que posicion_paraborrar <= cantreg(0) y posicion_paraborrar>0 //valida un valor menor que la cantidad de registros
	
	
	
	// mueve luego el ultimo registro al lugar vacio
	i<-cantreg[0]-1;         //averiguamos la ultima fila de la matriz
	Para j<-0 Hasta 2 Con Paso 1 Hacer
		matrizcaja[posicion_paraborrar-1,j]<-matrizcaja[i,j];//escribe la ultima posicion en el valor asignado
		matrizcaja[i,j]<-0;//escribe o en la ultima posicion
	FinPara
	cantreg[0]<-cantreg[0]-1;//porque bajo la cantidad de lineas de matrizcaja
FinFuncion
///fin de borrar valores de caja

Proceso sin_titulo
	///DEFINICION DE VARIABLES PARA LOGGUEO
	DEFINIR usuario Como caracter;//EL VALOR LOGGIN OBTENDRA COMO RESULTADO UN NUMERO INDICE QUE DETERMINA AL 
	// USUARIO EN USO.
	
	definir matrizusuarios como caracter;
	dimension matrizusuarios(2,3);
	// matriz 
	//EL PRIMER VALOR DETERMINA EL USUARIO AL QUE CORRESPONDE, EL SEGUNDO INDICACA
	// PARA 0 NOMBRE DE USUARIO
	// PARA 1 CLAVE DEL USUARIO
	// PARA 2 SI ES ADMIN O USUARIO
	
	
	/// FIN DE DEFINICION DE VARIABLES PARA LOGGUEO
	//-----------------------------------------------
	/// DEFINICION DE VARIABLES DE CAJA Y VARIABLE DE NOMBRE SUCURSAL
	DEFINIR MATRIZCAJA , i, cantreg , j,salida COMO ENTERO;
	DEFINIR nombsucursal COMO CARACTER;
	Dimension MATRIZCAJA(200,3);
	DIMENSION nombsucursal(200,2);
	dimension cantreg(3);
	salida<-1;
	/// LLENA LA MATRIZ DE SUCURSAL, FECHA Y CAJA
	llenador(matrizusuarios,matrizcaja,nombsucursal,cantreg);
	i<-0;
	
	
	
	///FIN DE SUBPROCESO
	//-----------------------------------------------
	///LLAMA A SUBPROCESO DE LOGGUEO
	USUARIO<-LOGGUEO(matrizusuarios); //LOGGING CONTIENE EL NRO INDICE DEL USUARIO QUE INGRESO, SI VALE 100 EL PROGRAMA SE DEBERIA CERRAR
	escribir usuario;
	///finaliza el llamado
	
	///inicia llamado a menu si usuario corresponde a administrador o usuario
	si usuario="administrador" o usuario="usuario" entonces
		repetir
			salida<-menu(usuario,matrizcaja,matrizusuarios,matrizsucursal,cantreg,nombsucursal);
		Hasta Que salida=0	
	FinSi
	
	
	
	///finaliza llamado de menu
	
	
	
	
	
	
	
	
	
FinProceso




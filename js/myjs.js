$(document).ready(function(){
	limpiar();
	$('#btn-registrar').on('click', function(){
		
    var nombre=$.trim($("#inpnombre").val());
    var app=$.trim($("#inpapp").val());
    var apm=$.trim($("#inpapm").val());
    var correo=$.trim($("#inpcorreo").val());
    var contraseña=$("#inpcontrasena").val();
    var contraseña2=$("#inpcontrasena2").val();
    
    if(nombre!="") //Se verifica que haya algun nombre
    {
    	$("#errnombre").hide();
    	if(app!="")
    	{
    		$("#errorapp").hide();
    		if(apm!="")
    		{
    			$("#errorapm").hide();
    			if(correo!="")
    			{
    				$("#erroremail").hide();
    				var expresion=/^[a-z][\w.-]+@\w[\w.-]+\.[\w.-]*[a-z][a-z]$/i;
					if (expresion.test(correo))
					{
						$("#erroremail").hide();
						if(contraseña!="" && contraseña==contraseña2)
						{
							$("#errorcontra").hide();
							$("#errorcontra2").hide();
							if(contraseña.length>=8 && contraseña.length<=16)
							{
							$("#errorcontra").hide();
							$("#errorcontra2").hide();
							registrarcliente();

							}else
								{
									$("#errorcontra").show();
									$("#errorcontra2").show();

								}

						}
						else
						{
							$("#errorcontra").show();
							$("#errorcontra2").show();

						}
		
					}
					else
					{
						$("#erroremail").show();

					}

    			}
    			else
    			{
    				$("#erroremail").show();

    			}

    		}else
    		{
    			$("#errorapm").show();

    		}
    	}
    	else
    	{
    		$("#errorapp").show();

    	}
    }else
    	{
    		$("#errnombre").show();
    		

    	}

	});
    
function registrarcliente(){
	$.ajax(
		{
		type: "POST",
		async: true,
		url: "registrarcliente.php",
		timeout: 12000,
		data: $("#formulario").serialize(),
		dataType: "json",
		success: function(response)
		{
			if(response.Status=="Registrado")
			{
				alert("Registrado con exito");
				limpiar();
			}
			else
			{
				if(response.Status=="Correo ya registrado")
				{
					alert("Error Correo ya usado");
					$("#erroremail").show();
				}
				else
				{

				}
			}
			
		}
    
		});

}
function limpiar()
{
	$("#inpnombre").val("");
   $("#inpapp").val("");
    $("#inpapm").val("");
    $("#inpcorreo").val("");
    $("#inpcontrasena").val("");
    $("#inpcontrasena2").val("");

}

});
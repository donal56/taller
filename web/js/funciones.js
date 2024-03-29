$(function() {
  $('img[alt="www.000webhost.com"]').parent().parent().next().remove();
  $('img[alt="www.000webhost.com"]').parent().parent().remove();
});

var csrfToken = $('meta[name=csrf-token]').attr('content');

function espera() {
   bootbox.dialog({ 
            size: 'small',
            message: "<p><img src='/plantillas/itvh/logos/loading.gif' width='50' height='50'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Generando Solicitud...</p>", 
        });
   return true;
}

function asignacion(ticket) {
  var tecnico = $('select[name=fkTecnico] option:selected').val();
  bootbox.dialog({ 
            size: 'small',
            message: "<p><img src='/plantillas/itvh/logos/loading.gif' width='50' height='50'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Asignando Técnico...</p>", 
        });
  if(tecnico !== '') {
    $.post('/ticket/asignar-tecnico', { _csrf:csrfToken, datos:{ ticketId:ticket, tecnicoId:tecnico } })
    .done(function(d) {
      if(d !== '0') {
        var datos = JSON.parse(d);
        if( dirKCFinder(datos.asignacion.id, datos.asignacion.fkTecnico) ) {
          window.location.reload();
        }
      }
    }).fail(function(f) { console.log(f.responseText); });

  } else {
    bootbox.alert({ 
        size: 'small',
        message: "Se necesita seleccionar un técnico", 
    });
  }
}

function estatus(ticket, estatus) {
  $.post('/ticket/estatus-ticket', { _csrf:csrfToken, datos:{ ticket:ticket, estatus:estatus } })
  .done(function(d) {
    if(d !== '0') {
      var est = JSON.parse(d);
      if(est.id == '4') {
        $('#btn-asignar').prop('disabled', true);
      } else if(est.id == '5') {
        $('#btn-asignar').prop('disabled', true);
      } else {
        $('#btn-asignar').prop('disabled', false);
      }      
      $('#estatus').text(est.nmb);
      window.location.reload();
    }
  }).fail(function(f) { console.log(f.responseText); });
}

function finSeguimiento(asId, p) {
  var reporte = $('#editor-reporte').html();
  bootbox.confirm({
      title: 'Finalizar seguimiento.',
      message: '¿Deseas finalizar el seguimiento?',
      buttons: {
          'cancel': {
              label: 'Cancelar',
              className: 'btn-danger pull-left',
          },
          'confirm': {
              label: 'Confirmar',
              className: 'btn-success pull-right',
          }
      },
      callback: function(result) {
        if (result == true) {
          $.post('/ticket/finalizar-seguimiento', {_csrf:csrfToken, reporte:reporte, asignacion:asId})
          .done(function(d) { 
             
                  if(parseInt(d) == 1) {
                    if(p !== 0) {
                      window.location.reload(); 
                    } else {
                      window.location.href = '/'; 
                    }
                    
                  } else {
                    alertify.error('<strong><font color="white">Ha ocurrido un problema al realizar esta operación.</font></strong>');
                  }               
          })
          .fail(function(f) { 
            alertify.error('<strong><font color="white">Ha ocurrido un problema al realizar esta operación.</font></strong>');
            console.log(f.responseText);  
          });               
        } else {
          alertify.error('<strong><font color="white">Operación Cancelada.</font></strong>');
        }
      }
  });
}
function reportefinal(asId, p) {
  var reporte = $('#editor-reporte').html();
  bootbox.confirm({
      title: 'Finalizar seguimiento.',
      message: '¿Deseas finalizar el seguimiento?',
      buttons: {
          'cancel': {
              label: 'Cancelar',
              className: 'btn-danger pull-left',
          },
          'confirm': {
              label: 'Confirmar',
              className: 'btn-success pull-right',
          }
      },
      callback: function(result) {
        if (result == true) {
          $.post('/ticket/finalizar-seguimiento2', {_csrf:csrfToken, reporte:reporte, asignacion:asId})
          .done(function(d) { 
                  if(parseInt(d) == 1) {
                    if(p !== 0) {
                      window.location.reload(); 
                    } else {
                      window.location.href = '/'; 
                    }
                    
                  } else {
                    alertify.error('<strong><font color="white">Ha ocurrido un problema al realizar esta operación.</font></strong>');
                  }               
          })
          .fail(function(f) { 
            alertify.error('<strong><font color="white">Ha ocurrido un problema al realizar esta operación.</font></strong>');
            console.log(f.responseText);  
          });               
        } else {
          alertify.error('<strong><font color="white">Operación Cancelada.</font></strong>');
        }
      }
  });
}

function comentario(id, accion) {
  switch (accion) {
      case 0:
          bootbox.prompt({
              title: 'Capturar nuevo comentario',
              message: 'Are you sure you want to delete this Calendar Event. If not, click Cance. There is no undo!l',
              buttons: {
                  'cancel': {
                      label: 'Cancelar',
                      className: 'btn-danger pull-left'
                  },
                  'confirm': {
                      label: 'Agregar',
                      className: 'btn-success pull-right'
                  }
              },
              callback: function(comentario) {
                  if (comentario === null) {
                      alertify.error('<strong><font color="white">Operación Cancelada.</font></strong>');
                  } else {
                    $.post('/ticket/comentario', {_csrf:csrfToken, accion:0, comentario:comentario, ticket:id})
                    .done(function(d) { 
                      if(parseInt(d) == 1) {
                        window.location.reload();
                      } else {
                        alertify.error('<strong><font color="white">Ha ocurrido un problema al realizar esta operación.</font></strong>');
                      }        
                    })
                    .fail(function(f) { 
                      alertify.error('<strong><font color="white">Ha ocurrido un problema al realizar esta operación.</font></strong>');
                      console.log(f.responseText);  
                    });    
                  }
              }
          });
          break;
          case 1:
            $.post('/ticket/comentario', {_csrf:csrfToken, accion:2, id:id})
            .done(function(d) {
              if(d !== undefined) {
                if(d !== null) {
                  var com = JSON.parse(d);
                  bootbox.prompt({
                    title: 'Modificar comentario',
                    value: com.contenido,
                    buttons: {
                        'cancel': {
                            label: 'Cancelar',
                            className: 'btn-danger pull-left'
                        },
                        'confirm': {
                            label: 'Modificar',
                            className: 'btn-success pull-right'
                        }
                    },
                    callback: function(comentario) {
                        if (comentario === null) {
                            alertify.error('<strong><font color="white">Operación Cancelada.</font></strong>');
                        } else {
                          $.post('/ticket/comentario', {_csrf:csrfToken, accion:1, comentario:comentario, id:id})
                          .done(function(d) { 
                            if(parseInt(d) == 1) {
                              window.location.reload();
                            } else {
                              alertify.error('<strong><font color="white">Ha ocurrido un problema al realizar esta operación.</font></strong>');
                            }       
                          })
                          .fail(function(f) { 
                            alertify.error('<strong><font color="white">Ha ocurrido un problema al realizar esta operación.</font></strong>');
                            console.log(f.responseText);  
                          });    
                        }
                      }
                  });                
                }
              }
            }).fail(function(f) { 
              alertify.error('<strong><font color="white">Ha ocurrido un problema al realizar esta operación.</font></strong>');
              console.log(f.responseText); 
            });
          break;
  }
}
function comentarioresp(id, accion, respuesta) { 
//console.log(resp);
  switch (accion) {
      case 0:
          bootbox.prompt({
              title: 'Capturar respuesta a comentario de la solicitud: '+id,
              message: 'Are you sure you want to delete this Calendar Event. If not, click Cance. There is no undo!l',
              buttons: {
                  'cancel': {
                      label: 'Cancelar',
                      className: 'btn-danger pull-left'
                  },
                  'confirm': {
                      label: 'Agregar',
                      className: 'btn-success pull-right'
                  }
              },
              callback: function(comentario) {
                  if (comentario === null) {
                      alertify.error('<strong><font color="white">Operación Cancelada.</font></strong>');
                  } else {
                    $.post('/ticket/comentario2', {_csrf:csrfToken, accion:0, comentario:comentario, ticket:id, respuesta:respuesta })
                    .done(function(d) {
                       //console.log(d);
                      if(parseInt(d) == 1) {
                      window.location.reload();
                     } else {
                     
                       alertify.error('<strong><font color="white">Ha ocurrido un problema al realizar esta operación.</font></strong>');
                     }     
                    })
                    .fail(function(f) { 
                     //console.log(f); 
                      alertify.error('<strong><font color="white">Ha ocurrido un problema al realizar esta operación.</font></strong>');
                      console.log(f.responseText);  
                    });    
                  }
              }
          });
          break;
          case 1:
            $.post('/ticket/comentario2', {_csrf:csrfToken, accion:2, id:id, respuesta:respuesta })
            .done(function(d) {
              if(d !== undefined) {
                if(d !== null) {
                  var com = JSON.parse(d);
                  bootbox.prompt({
                    title: 'Modificar comentario',
                    value: com.contenido,
                    buttons: {
                        'cancel': {
                            label: 'Cancelar',
                            className: 'btn-danger pull-left'
                        },
                        'confirm': {
                            label: 'Modificar',
                            className: 'btn-success pull-right'
                        }
                    },
                    callback: function(comentario) {
                        if (comentario === null) {
                            alertify.error('<strong><font color="white">Operación Cancelada.</font></strong>');
                        } else {
                          $.post('/ticket/comentario2', {_csrf:csrfToken, accion:1, comentario:comentario, id:id, respuesta:respuesta })
                          .done(function(d) { 
                            if(parseInt(d) == 1) {
                              window.location.reload();
                            } else {
                              alertify.error('<strong><font color="white">Ha ocurrido un problema al realizar esta operación.</font></strong>');
                            }        
                          })
                          .fail(function(f) { 
                            alertify.error('<strong><font color="white">Ha ocurrido un problema al realizar esta operación.</font></strong>');
                            console.log(f.responseText);  
                          });    
                        }
                      }
                  });                
                }
              }
            }).fail(function(f) { 
              alertify.error('<strong><font color="white">Ha ocurrido un problema al realizar esta operación.</font></strong>');
              console.log(f.responseText); 
            });
          break;
  }
}
//
function comentariotec(id, accion) {
  switch (accion) {
      case 0:
          bootbox.prompt({
              title: 'Capturar nuevo comentario',
              message: 'Are you sure you want to delete this Calendar Event. If not, click Cance. There is no undo!l',
              buttons: {
                  'cancel': {
                      label: 'Cancelar',
                      className: 'btn-danger pull-left'
                  },
                  'confirm': {
                      label: 'Agregar',
                      className: 'btn-success pull-right'
                  }
              },
              callback: function(comentario) {
                  if (comentario === null) {
                      alertify.error('<strong><font color="white">Operación Cancelada.</font></strong>');
                  } else {
                    $.post('/ticket/comentariotec', {_csrf:csrfToken, accion:0, comentario:comentario, ticket:id})
                    .done(function(d) { 
                      if(parseInt(d) == 1) {
                        window.location.reload();
                      } else {
                        alertify.error('<strong><font color="white">Ha ocurrido un problema al realizar esta operación.</font></strong>');
                      }        
                    })
                    .fail(function(f) { 
                      alertify.error('<strong><font color="white">Ha ocurrido un problema al realizar esta operación.</font></strong>');
                      console.log(f.responseText);  
                    });    
                  }
              }
          });
          break;
          case 1:
            $.post('/ticket/comentariotec', {_csrf:csrfToken, accion:2, id:id})
            .done(function(d) {
              if(d !== undefined) {
                if(d !== null) {
                  var com = JSON.parse(d);
                  bootbox.prompt({
                    title: 'Modificar comentario',
                    value: com.contenido,
                    buttons: {
                        'cancel': {
                            label: 'Cancelar',
                            className: 'btn-danger pull-left'
                        },
                        'confirm': {
                            label: 'Modificar',
                            className: 'btn-success pull-right'
                        }
                    },
                    callback: function(comentario) {
                        if (comentario === null) {
                            alertify.error('<strong><font color="white">Operación Cancelada.</font></strong>');
                        } else {
                          $.post('/ticket/comentariotec', {_csrf:csrfToken, accion:1, comentario:comentario, id:id})
                          .done(function(d) { 
                            if(parseInt(d) == 1) {
                              window.location.reload();
                            } else {
                              alertify.error('<strong><font color="white">Ha ocurrido un problema al realizar esta operación.</font></strong>');
                            }       
                          })
                          .fail(function(f) { 
                            alertify.error('<strong><font color="white">Ha ocurrido un problema al realizar esta operación.</font></strong>');
                            console.log(f.responseText);  
                          });    
                        }
                      }
                  });                
                }
              }
            }).fail(function(f) { 
              alertify.error('<strong><font color="white">Ha ocurrido un problema al realizar esta operación.</font></strong>');
              console.log(f.responseText); 
            });
          break;
  }
}
function comentarioresptec(id, accion, respuesta) { 
//console.log(resp);
  switch (accion) {
      case 0:
          bootbox.prompt({
              title: 'Capturar respuesta a comentario de la solicitud: '+id,
              message: 'Are you sure you want to delete this Calendar Event. If not, click Cance. There is no undo!l',
              buttons: {
                  'cancel': {
                      label: 'Cancelar',
                      className: 'btn-danger pull-left'
                  },
                  'confirm': {
                      label: 'Agregar',
                      className: 'btn-success pull-right'
                  }
              },
              callback: function(comentario) {
                  if (comentario === null) {
                      alertify.error('<strong><font color="white">Operación Cancelada.</font></strong>');
                  } else {
                    $.post('/ticket/comentario2tec', {_csrf:csrfToken, accion:0, comentario:comentario, ticket:id, respuesta:respuesta })
                    .done(function(d) {
                       //console.log(d);
                      if(parseInt(d) == 1) {
                      window.location.reload();
                     } else {
                     
                       alertify.error('<strong><font color="white">Ha ocurrido un problema al realizar esta operación.</font></strong>');
                     }     
                    })
                    .fail(function(f) { 
                     //console.log(f); 
                      alertify.error('<strong><font color="white">Ha ocurrido un problema al realizar esta operación.</font></strong>');
                      console.log(f.responseText);  
                    });    
                  }
              }
          });
          break;
          case 1:
            $.post('/ticket/comentario2tec', {_csrf:csrfToken, accion:2, id:id, respuesta:respuesta })
            .done(function(d) {
              if(d !== undefined) {
                if(d !== null) {
                  var com = JSON.parse(d);
                  bootbox.prompt({
                    title: 'Modificar comentario',
                    value: com.contenido,
                    buttons: {
                        'cancel': {
                            label: 'Cancelar',
                            className: 'btn-danger pull-left'
                        },
                        'confirm': {
                            label: 'Modificar',
                            className: 'btn-success pull-right'
                        }
                    },
                    callback: function(comentario) {
                        if (comentario === null) {
                            alertify.error('<strong><font color="white">Operación Cancelada.</font></strong>');
                        } else {
                          $.post('/ticket/comentario2tec', {_csrf:csrfToken, accion:1, comentario:comentario, id:id, respuesta:respuesta })
                          .done(function(d) { 
                            if(parseInt(d) == 1) {
                              window.location.reload();
                            } else {
                              alertify.error('<strong><font color="white">Ha ocurrido un problema al realizar esta operación.</font></strong>');
                            }        
                          })
                          .fail(function(f) { 
                            alertify.error('<strong><font color="white">Ha ocurrido un problema al realizar esta operación.</font></strong>');
                            console.log(f.responseText);  
                          });    
                        }
                      }
                  });                
                }
              }
            }).fail(function(f) { 
              alertify.error('<strong><font color="white">Ha ocurrido un problema al realizar esta operación.</font></strong>');
              console.log(f.responseText); 
            });
          break;
  }
}
function ticketInfo(id) {
  $.get('/ticket/ticket-info', {id:id})
  .done(function(html) {
    if(html !== null) {
      if(html !== undefined) {
        bootbox.dialog({
          message: html,
          size:'large',
          title: "Visualizar información",
          buttons: {
            success: {
              label: "Entendido",
              className: "btn-success",
            },
          }
        });
      } else {
        alertify.error('<strong><font color="white">Ha ocurrido un problema al realizar esta operación.</font></strong>');
      }
    } else {
      alertify.error('<strong><font color="white">Ha ocurrido un problema al realizar esta operación.</font></strong>');
    }

  }).fail(function(f) { console.log(f.responseText); });
}

function dirKCFinder(asId, tecId) {
  $.get('/ticket/dir-kcfinder', {tecId:tecId, asId:asId})
  .done(function(d) {
  }).fail(function(f) { console.log(f.responseText); });
  return true;
}

function verReporte(asId) {
  $.get('/ticket/obtener-reporte', {asId:asId})
  .done(function(d) {
    if(d !== undefined) {
      bootbox.dialog({
        message: d,
        title: "<h4>Visualizar Reporte - Asignación #"+asId+"</h4>",
        buttons: {
          success: {
            label: "Entendido",
            className: "btn-success",
          },
        }
      });   
    } else {
      bootbox.alert({ 
          size: 'small',
          message: "Ha ocurrido un error al obtener éste reporte.", 
      });      
    }
  }).fail(function(f) { console.log(f.responseText); });
}

function verEvidencias(dir) {
  if(dir !== undefined) {
    $.get('/ticket/evidencias', {dir:dir})
    .done(function(html) {
      if(html !== null) {
        bootbox.dialog({
          message: html,
          size:'large',
          title: "Visualizar evidencias",
          buttons: {
            success: {
              label: "Entendido",
              className: "btn-success",
            },
          }
        });  
      } else {
        alertify.error('<strong><font color="white">No se encontraron evidencias.</font></strong>');
      }
    }).fail(function(f) { 
      bootbox.dialog({
        message: '<div align="center"><p>No se encontraron evidencias.</p></div>',
        size:'small',
        title: "Notificación",
        buttons: {
          success: {
            label: "Entendido",
            className: "btn-success",
          },
        }
      });      
      //console.log(f.responseText); 
    });    
  } else {
    alertify.error('<strong><font color="white">No se encontró un directorio con evidencias.</font></strong>');
  }
}
function reasignar(id,ads) {
   var opcionesTodas = [
           {
               text: 'Computo',
               value: '26',
           },
           {
               text: 'Mantenimiento',
               value: '87',
           },
           {
               text: 'Infraestructura',
               value: '85',
           }
       ];
   var opciones =[];
    $.each(opcionesTodas, function(i, item){
           if(item.value!=ads)opciones.push(item);  
        });

       bootbox.prompt({
       title: "<center>Seleccione el<br>nuevo departamento</center>",
       inputType: 'select',
       size:'small',
       inputOptions: opciones,
       callback: function (result) {
          if(result != null){
            $.post('/ticket/reasignado', {_csrf:csrfToken, datos:{ id:id, depto:result } })
            .done(function(d) { 
                if(parseInt(d) == 1) {
                  window.location.reload();
                } else {
                  alertify.error('<strong><font color="white">Ha ocurrido un problema al realizar esta operación.</font></strong>');
                }
               });
          }
       }
   });
}
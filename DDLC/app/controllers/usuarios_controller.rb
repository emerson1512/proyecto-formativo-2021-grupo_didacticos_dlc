# esta clase usuario funcionara como controlador para renderizar hacia la vista usuario-
# -métodos que se van a encargar de procesar las peticiones HTTP.
# @Autor: Roberto Cahuana - Desarrollador
# @version: 1.0

class UsuariosController < ApplicationController

  # @Método GET  para  el formulario de nuevo usuario
  def new
    @usuario = Usuario.new
  end

  # @Método GET para obtener todos los usuarios de la Base de Datos
  def index
    @usuarios = Usuario.all
  end

  # @Metodo PATCH Encontrar un usuario especifico por id en la tabla usuario
  def show
    @usuario = Usuario.find(params[:id])
  end

  # @Método GET  para  editar un usuario basado en id en la Base de Dato
  def edit
    @usuario = Usuario.find(params[:id])
  end

  # @Método POST  para  procesar datos de formularios
  def create
    @usuario = Usuario.new(usuario_params)
    if @usuario.save
      flash[:notice] = 'usuario agregado!'
      redirect_to @usuario
    else
      render "new"
    end
  end

  # @Metodo  PUT  para actualizar usuario por id en la Base de Datos
  def update
    @usuario = Usuario.find(params[:id])
    if @usuario.update(usuario_params)
      flash[:notice] = 'usuario atualizado!'
      redirect_to @usuario
    else
      render "edit"
    end
  end

  # @Metodo DELETE  Sirve para eliminar usuario por id en la Base de Datos
  def destroy
    @usuario = Usuario.find(params[:id])
    if @usuario.destroy
      flash[:notice] = '¡usuario eliminado!'
      redirect_to  @usuario
    else
      render "destroy"
    end
  end

  private

  def usuario_params
    params.require(:usuario).permit(
      :identificacion,
      :nombre,
      :telefono,
      :direccion,
    )
  end
end

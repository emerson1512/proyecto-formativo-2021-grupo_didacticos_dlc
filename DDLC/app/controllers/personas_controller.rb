# esta clase persona funcionara como controlador para renderizar hacia la vista persona
# @Autor: Roberto Cahuana - Desarrollador
# @version: 1.0

class PersonasController < ApplicationController

  # @Método GET  para  el formulario de nuevo persona
  def new
    @persona = Persona.new
  end

  # @Método GET para obtener todos los personas de la base de datos
  def index
    @personas = Persona.all
  end

  # @Metodo PATCH Encontrar un persona especifico por id en la tabla persona
  def show
    @persona = Persona.find(params[:id])
  end

  # @Método GET  para  editar un persona basado en id en la Base de Dato
  def edit
    @persona = Persona.find(params[:id])
  end

  # @Método POST  para  procesar datos de formularios
  def create
    @persona = Persona.new(persona_params)
    if @persona.save
      flash[:notice] = 'persona agregada!'
      redirect_to personas_path
    else
      render :new
    end
  end

  # @Metodo  PUT  para actualizar persona por id en la base de datos
  def update
    @persona = Persona.find(params[:id])
    if @persona.update(persona_params)
      flash[:notice] = 'persona atualizada!'
      redirect_to @persona
    else
      @persona = Persona.all
      render "edit", status: :unprocessable_entity
    end
  end

  # @Metodo DELETE  Sirve para eliminar persona por id en la base de datos
  def destroy
    @persona = Persona.find(params[:id])
    if @persona.destroy
      flash[:notice] = '¡persona eliminado!'
      redirect_to  @persona
    else
      render "destroy"
    end
  end

  private

  def persona_params
    params.require(:persona).permit(
      :cedula,
      :fecha_nacimiento,
      :telefono,
      :genero_id
    )
  end
end

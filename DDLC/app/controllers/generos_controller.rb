# esta clase genero funcionara como controlador para renderizar hacia la vista genero
# @Autor: Roberto Cahuana - Desarrollador
# @version: 1.0

class GenerosController < ApplicationController

  # @Método GET  para  el formulario de nuevo genero
  def new
    @genero = Genero.new
  end

  # @Método GET para obtener todos los generos de la base de datos
  def index
    @generos = Genero.all
  end

  # @Metodo PATCH Encontrar un genero especifico por id en la tabla genero
  def show
    @genero = Genero.find(params[:id])
  end

  # @Método GET  para  editar un genero basado en id en la Base de Datos
  def edit
    @genero = Genero.find(params[:id])
  end

  # @Método POST  para  procesar datos de formularios
  def create
    @genero = Genero.new(genero_params)
    if @genero.save
      flash[:notice] = 'genero agregado!'
      redirect_to @genero
    else
      render "new"
    end
  end

  # @Metodo  PUT  para actualizar genero por id en la base de datos
  def update
    @genero = Genero.find(params[:id])
    if @genero.update(genero_params)
      flash[:notice] = 'genero atualizado!'
      redirect_to @genero
    else
      render "edit", status: :unprocessable_entity
    end
  end

  # @Metodo DELETE  Sirve para eliminar genero por id en la base de datos
  def destroy
    @genero = Genero.find(params[:id])
    if @genero.destroy
      flash[:notice] = '¡genero eliminado!'
      redirect_to  @genero
    else
      flash[:error] = '¡Error al eliminar este genero!'
      render "destroy"
    end
  end

  private

  def genero_params
    params.require(:genero).permit(
      :genero,
    )
  end

end

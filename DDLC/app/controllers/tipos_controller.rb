# esta clase tipo funcionara como controlador para renderizar hacia la vista tipo
# @Autor: Roberto Cahuana - Desarrollador
# @version: 1.0

class TiposController < ApplicationController

  # @Método GET  para  el formulario de nuevo tipo
  def new
    @tipo = Tipo.new
  end

  # @Método GET para obtener todos los tipos de la base de datos
  def index
    @tipos = Tipo.all
  end

  # @Metodo PATCH Encontrar un tipo especifico por id en la tabla tipo
  def show
    @tipo = Tipo.find(params[:id])
  end

  # @Método GET  para  editar un tipo basado en id
  def edit
    @tipo = Tipo.find(params[:id])
  end

  # @Método POST  para  procesar datos de formularios
  def create
    @tipo = Tipo.new(tipo_params)
    if @tipo.save
      flash[:notice] = 'tipo agregado!'
      redirect_to @tipo
    else
      render "new"
    end
  end

  # @Metodo  PUT  para actualizar tipo por id en la base de datos
  def update
    @tipo = Tipo.find(params[:id])
    if @tipo.update(tipo_params)
      flash[:notice] = 'tipo atualizado!'
      redirect_to @tipo
    else
      render 'edit'
    end
  end

  # @Metodo DELETE  Sirve para eliminar tipo por id en la base de datos
  def destroy
    @tipo = Tipo.find(params[:id])
    if @tipo.destroy
      flash[:success] = 'tipo eliminado.'
      redirect_to @tipo
    else
      flash[:error] = 'Something went wrong'
      redirect_to "destroy"
    end
  end

  private

  def tipo_params
    params.require(:tipo).permit(
      :tipo,
      :estado,
    )
  end
end

# esta clase stoockdeproducto funcionara como controlador para renderizar hacia la vista stoockdeproducto
# @Autor: Roberto Cahuana - Desarrollador
# @version: 1.0

class StoockdeproductosController < ApplicationController

  # @Método GET  para  el formulario de nuevo stoockdeproducto
  def new
    @stoockdeproducto = Stoockdeproducto.new
  end

  # @Método GET para obtener todos los stoockdeproductos de la base de datos
  def index
    @stoockdeproductos = Stoockdeproducto.all
  end

  # @Metodo PATCH Encontrar un stoockdeproducto especifico por id en la tabla stoockdeproducto
  def show
    @stoockdeproducto = Stoockdeproducto.find(params[:id])
  end

  # @Método GET  para  editar un stoockdeproducto basado en id en la Base de Dato
  def edit
    @stoockdeproducto = Stoockdeproducto.find(params[:id])
  end

  # @Método POST  para  procesar datos de formularios
  def create
    @stoockdeproducto = Stoockdeproducto.new(stoockdeproducto_params)
    if @stoockdeproducto.save
      flash[:notice] = 'stoockdeproducto agregado!'
      redirect_to @stoockdeproducto
    else
      render :new
    end
  end

  # @Metodo  PUT  para actualizar stoockdeproducto por medio de id en la base de datos
  def update
    @stoockdeproducto = Stoockdeproducto.find(params[:id])
    if @stoockdeproducto.update(stoockdeproducto_params)
      flash[:notice] = 'stoockdeproducto atualizado!'
      redirect_to @stoockdeproducto
    else
      render 'edit'
    end
  end

  # @Metodo DELETE  Sirve para eliminar stoockdeproducto por id en la base de datos
  def destroy
    @stoockdeproducto = Stoockdeproducto.find(params[:id])
    if @stoockdeproducto.destroy
      flash[:success] = 'stoockdeproducto was successfully deleted.'
      redirect_to  @stoockdeproducto
    else
      redirect_to "destroy"
    end
  end

  private

  def stoockdeproducto_params
    params.require(:stoockdeproducto).permit(
      :codigo,
      :nombre,
      :cantidad_existente,
      :referencia,
      :tipo,
      :proveedor,
    )
  end
end

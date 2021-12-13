# esta clase producto funcionara como controlador para renderizar hacia la vista producto
# @Autor: Roberto Cahuana - Desarrollador
# @version: 1.0

class ProductosController < ApplicationController

  before_action :authenticate_user!

  # before_action :authenticate_user!, only: [:index]

  # @Método GET  para  el formulario de nuevo producto
  def new
    @producto = Producto.new
  end

  # @Método GET para obtener todos los productos de la base de datos
  def index
    @productos = Producto.all
  end

  # @Metodo PATCH Encontrar un producto especifico por id en la tabla producto
  def show
    @producto = Producto.find(params[:id])
  end

  # @Método GET  para  editar un producto basado en id en la Base de Dato
  def edit
    @producto = Producto.find(params[:id])
  end

  # @Método POST  para  procesar datos de formularios
  def create
    @producto = Producto.new(producto_params)
    if @producto.save
      flash[:notice] = 'Producto agregado!'
      redirect_to @producto
    else
      flash[:error] = 'No se pudo editar el productos!'
      render "new"
    end
  end

  # @Metodo  PUT  para actualizar producto por id en la base de datos
  def update
    @producto = Producto.find(params[:id])
    if @producto.update(producto_params)
      flash[:notice] = 'producto atualizado!'
      redirect_to @producto
    else
      render "edit", status: :unprocessable_entity
    end
  end

  # @Metodo DELETE  Sirve para eliminar producto por id en la base de datos
  def destroy
    @producto = Producto.find(params[:id])
    if @producto.destroy
      flash[:notice] = '¡Producto eliminado!'
      redirect_to  @producto
    else
      render "destroy"
    end
  end

  private

  def producto_params
    params.require(:producto).permit(
      :codigo,
      :nombre,
      :referencia,
      :stock,
      :precio,
      :tipo_id,
      :foto
    )
  end

end

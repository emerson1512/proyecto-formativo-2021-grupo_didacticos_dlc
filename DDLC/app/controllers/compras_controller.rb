# esta clase compra funcionara como controlador para renderizar hacia la vista compra
# @Autor: Roberto Cahuana - Desarrollador
# @version: 1.0

class ComprasController < ApplicationController

  # @Método GET  para  el formulario de nuevo compra
  def new
    @compra = Compra.new
  end

   # @Método GET para obtener todos los compras de la base de datos
  def index
    @compras = Compra.all
  end

  # @Metodo PATCH Encontrar un compra especifico por id en la tabla compra
  def show
    @compra = Compra.find(params[:id])
  end

  # @Método POST  para  procesar datos de formularios
  def create
    @compra = Compra.new( compra_params)
    if @compra.save
      flash[:notice] = 'compra agregada!'
      redirect_to @compra
    else
      render :new
    end
  end

  # @Método GET  para  editar un compra basado en id en la Base de Dato
  def edit
    @compra = Compra.find(params[:id])
  end

  # @Metodo  PUT  para actualizar compra por id en la base de datos
  def update
    @compra = Compra.find(params[:id])
    if @compra.update(compra_params)
      redirect_to @compra, notice: 'compras was successfully updated.'
    else
      render 'edit'
    end
  end

  # @Metodo DELETE  Sirve para eliminar compra por id en la base de datos
  def destroy
    @compra = Compra.find(params[:id])
    if @compra.destroy
      flash[:success] = 'compras was successfully deleted.'
      redirect_to  @compra
    else
      flash[:error] = 'Something went wrong'
      render "destroy"
    end
  end

  private

  def compra_params
    params.require(:compra).permit(
      :codigo_producto,
      :nombre_del_cliente,
      :identificacion_del_cliente,
      :fecha_de_compra,
      :tipo_producto,
      :forma_de_pago,
    )
  end
end

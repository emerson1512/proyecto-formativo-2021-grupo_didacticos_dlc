# esta clase reclamo funcionara como controlador para renderizar hacia la vista reclamo
# @Autor: Roberto Cahuana - Desarrollador
# @version: 1.0

class ReclamosController < ApplicationController

  # @Método GET  para  el formulario de nuevo reclamo
  def new
    @reclamo = Reclamo.new
  end

  # @Método GET para obtener todos los reclamos de la base de datos
  def index
    @reclamos = Reclamo.all
  end

  # @Metodo PATCH Encontrar un reclamo especifico por id en la tabla reclamo
  def show
    @reclamo = Reclamo.find(params[:id])
  end

  # @Método GET  para  editar un reclamo basado en id en la Base de Dato
  def edit
    @reclamo = Reclamo.find(params[:id])
  end

  # @Método POST  para  procesar datos de formularios
  def create
    @reclamo = Reclamo.new(reclamo_params)
    if @reclamo.save
      flash[:notice] = 'reclamo agregado!'
      redirect_to @reclamo
    else
      render :new
    end
  end

  # @Metodo  PUT  para actualizar reclamo por id en la base de datos
  def update
    @reclamo = Reclamo.find(params[:id])
    if @reclamo.update(reclamo_params)
      flash[:notice] = 'compra atualizada!'
      redirect_to @reclamo
    else
      render "edit"
    end
  end

  # @Metodo DELETE  Sirve para eliminar reclamo por id en la base de datos
  def destroy
    @reclamo = Reclamo.find(params[:id])
    if @reclamo.destroy
      flash[:notice] = '¡reclamo eliminado!'
      redirect_to @reclamo
    else
      flash[:error] = '¡Error al eliminar este reclamo!'
      render "destroy"
    end
  end

  private

  def reclamo_params
    params.require(:reclamo).permit(
      :codigo,
      :identificacion_del_cliente,
      :nombre_del_cliente,
      :producto_adquirido,
      :fecha_de_compra,
      :estado_del_producto,
    )
  end
end

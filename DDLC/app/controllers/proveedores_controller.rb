# esta clase proveedor funcionara como controlador para renderizar hacia la vista proveedor
# @Autor: Roberto Cahuana - Desarrollador
# @version: 1.0

class ProveedoresController < ApplicationController

  # @Método GET  para  el formulario de nuevo proveedor
  def new
    @proveedor = Proveedor.new
  end

  # @Método GET para obtener todos los proveedores de la base de datos
  def index
    @proveedores = Proveedor.all
  end

  # @Metodo PATCH Encontrar un proveedor especifico por id en la tabla proveedor
  def show
    @proveedor = Proveedor.find(params[:id])
  end

  # @Método GET  para  editar un proveedor basado en id en la Base de Dato
  def edit
    @proveedor = Proveedor.find(params[:id])
  end

  # @Método POST  para  procesar datos de formularios
  def create
    @proveedor = Proveedor.new(proveedor_params)
    if @proveedor.save
      flash[:notice] = 'Proveedor agregado!'
      redirect_to  @proveedor
    else
      render "new"
    end
  end

  # @Metodo  PUT  para actualizar proveedor por id en la base de datos
  def update
      @proveedor = Proveedor.find(params[:id])
      if @proveedor.update(proveedor_params)
        redirect_to @proveedor , :notice => 'Proveedor fue actualizado con éxito.'
      else
        render "edit", status: :unprocessable_entity
      end
  end

  # @Metodo DELETE  Sirve para eliminar proveedor por id en la base de datos  
  def destroy
      @proveedor = Proveedor.find(params[:id])
      if @proveedor.destroy
        flash[:notice] = '¡Proveedor eliminado!'
        redirect_to @proveedor
      else
        render "destroy"
      end
  end

  private

  def proveedor_params
      params.require(:proveedor).permit(
        :codigo,
        :nombre,
        :correoelectronico,
        :telefono,
        :direccion,
        :ciudad,
        :destinario,
      )
  end
end

# esta clase registro funcionara como controlador para renderizar hacia la vista registro
# @Autor: Roberto Cahuana - Desarrollador
# @version: 1.0

class RegistrosController < ApplicationController

    # @Método GET  para  el formulario de nuevo registro
    def new
      @registro = Registro.new
    end

    # @Método GET para obtener todos los registros de la base de datos
    def index
      @registros = Registro.all
    end

    # @Metodo PATCH Encontrar un registro especifico por id en la tabla registro
    def show
      @registro = Registro.find(params[:id])
    end

    # @Método GET  para  editar un registro basado en id en la Base de Dato
    def edit
      @registro = Registro.find(params[:id])
    end

    # @Método POST  para  procesar datos de formularios
    def create
      @registro = Registro.new(registro_params)
      if @registro.save
        flash[:notice] = 'registro agregado!'
        redirect_to @registro
      else
        render :new
      end
    end

    # @Metodo  PUT  para actualizar registro por id en la base de datos
    def update
      @registro = Registro.find(params[:id])
      if @registro.update(registro_params)
        flash[:notice] = 'compra atualizada!'
        redirect_to @registro
      else
        render "edit"
      end
    end

    # @Metodo DELETE  Sirve para eliminar registro por id en la base de datos
    def destroy
      @registro = Registro.find(params[:id])
      if @registro.destroy
        flash[:notice] = '¡registro eliminado!'
        redirect_to  @registro
      else
        flash[:error] = '¡Error al eliminar este registro!'
        render "destroy"
      end
    end

    private

    def registro_params
      params.require(:registro).permit(
        :identificacion,
        :nombre,
        :correo_electronico,
        :fecha_de_nacimiento,
        :direccion,
        :ciudad,
        :cargo,
      )
    end
  end

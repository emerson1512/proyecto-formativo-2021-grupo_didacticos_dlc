# esta clase registrodetrabajadore funcionara como controlador para renderizar hacia la vista registrodetrabajadore
# @Autor: Roberto Cahuana - Desarrollador
# @version: 1.0

class RegistrodetrabajadoresController < ApplicationController

    # @Método GET  para  el formulario de nuevo registrodetrabajadore
    def new
      @registrodetrabajadore = Registrodetrabajadore.new
    end

    # @Método GET para obtener todos los registrodetrabajadores de la base de datos
    def index
      @registrodetrabajadores = Registrodetrabajadore.all
    end

    # @Metodo PATCH Encontrar un registrodetrabajadore especifico por id en la tabla registrodetrabajadore
    def show
      @registrodetrabajadore = Registrodetrabajadore.find(params[:id])
    end

    # @Método GET  para  editar un registrodetrabajadore basado en id en la Base de Dato
    def edit
      @registrodetrabajadore = Registrodetrabajadore.find(params[:id])
    end

    # @Método POST  para  procesar datos de formularios
    def create
      @registrodetrabajadore = Registrodetrabajadore.new( registrodetrabajadore_params)
      if @registrodetrabajadore.save
        flash[:notice] = 'Trabajador agregado!'
        redirect_to @registrodetrabajadore
      else
        render :new
      end
    end

    # @Metodo  PUT  para actualizar registrodetrabajadore por id en la base de datos
    def update
      @registrodetrabajadore = Registrodetrabajadore.find(params[:id])
      if @registrodetrabajadore.update(registrodetrabajadore_params)
        flash[:notice] = 'trabajador atualizado!'
        redirect_to @registrodetrabajadore
      else
        render 'edit'
      end
    end

    # @Metodo DELETE  Sirve para eliminar registrodetrabajadore por id en la base de datos
    def destroy
        @registrodetrabajadore = Registrodetrabajadore.find(params[:id])
        if @registrodetrabajadore.destroy
          flash[:notice] = '¡registrodetrabajadore eliminado!'
          redirect_to  @registrodetrabajadore
        else
          flash[:error] = '¡Error al eliminar este registrodetrabajadore!'
          render "destroy"
        end
      end

    private

    def registrodetrabajadore_params
        params.require(:registrodetrabajadore).permit(
          :nombre,
          :edad,
          :cargo,
          :telefono,
        )
    end

end

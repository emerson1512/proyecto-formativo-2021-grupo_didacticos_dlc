# esta clase organizacione funcionara como controlador para renderizar hacia la vista organizacione
# @Autor: Roberto Cahuana - Desarrollador
# @version: 1.0

class OrganizacionesController < ApplicationController

    # @Método GET  para  el formulario de nuevo organizacione
    def new
      @organizacione = Organizacione.new
    end

    # @Método GET para obtener todos los organizaciones de la base de datos
    def index
      @organizaciones = Organizacione.all
    end

    # @Metodo PATCH Encontrar un organizacione especifico por id en la tabla organizacione
    def show
      @organizacione = Organizacione.find(params[:id])
    end

    # @Método GET  para  editar un organizacione basado en id en la Base de Dato
    def edit
      @organizacione = Organizacione.find(params[:id])
    end

    # @Método POST  para  procesar datos de formularios
    def create
      @organizacione = Organizacione.new(organizacione_params)
      if @organizacione.save
        flash[:notice] = 'organizacion agregado!'
        redirect_to   @organizacione
      else
        render :new
      end
    end

    # @Metodo  PUT  para actualizar organizacione por id en la base de datos
    def update
      @organizacione = Organizacione.find(params[:id])
      if @organizacione.update(organizacione_params)
        flash[:notice] = 'organizacion atualizada!'
        redirect_to @organizacione
      else
        render "edit", status: :unprocessable_entity
      end
    end

    # @Metodo DELETE  Sirve para eliminar organizacione por id en la base de datos
    def destroy
      @organizacione = Organizacione.find(params[:id])
      if @organizacione.destroy
        flash[:notice] = 'la organizacione fue eliminado con éxito'
        redirect_to  @organizacione
      else
        redirect_to "destroy"
      end
    end

    private

    def organizacione_params
        params.require(:organizacione).permit(
          :tipo_de_organizacion,
          :numero_de_empleado,
          :representantes,
        )
    end
end

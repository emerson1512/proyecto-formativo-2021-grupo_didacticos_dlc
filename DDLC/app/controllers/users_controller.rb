# esta clase user funcionara como controlador para renderizar hacia la vista user
# @Autor: Roberto Cahuana - Desarrollador
# @version: 1.0

class UsersController < ApplicationController

  # @Método GET para obtener todos los users de la base de datos
  def index
    @users = User.order(created_at: :desc)
  end

  # @Método GET  para  editar un user basado en id
  def edit
    @user = User.find(params[:id])
  end

  # @Metodo  PUT  para actualizar user por id en la base de datos
  def update
    @user = User.find(params[:id])
      if @user.update(user_params)
        redirect_to  users_url, notice: "User was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
  end

  private
  def user_params
    params.require(:user).permit({role_ids: []})
  end
end

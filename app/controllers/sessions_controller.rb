class SessionsController < Devise::SessionsController

  def create
    super
    log("Usuario: "+current_user.email+" accedio al sistema, fecha/hora: "+current_user.last_sign_in_at.to_s+" desde: "+current_user.last_sign_in_ip)
 
  end
  def destroy
    super
  end
  private
  def log(event)
    @l=Log.new
    @l.description=event
    @l.user_id=current_user.id
    @l.save
  end    
end

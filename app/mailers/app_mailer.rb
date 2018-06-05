class AppMailer < ActionMailer::Base
 
  
    def new_reservation(room, reservation)
     
           @user = User.find(room.user_id)
     
           @reservation = reservation
     
           @room = room
     
     mail(from: 'Ekonda karlmoutome@gmail.com>', to: @user.email, subject: "Nouvelle réservation !")
     
     end
     
     end
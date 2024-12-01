import tkinter as tk
from tkinter import messagebox
from PIL import Image, ImageTk
import subprocess

def logout():
    subprocess.call(["killall", "i3"])

def reboot():
    subprocess.call(["systemctl", "reboot"])

def shutdown():
    subprocess.call(["systemctl", "poweroff"])

# Create the main window
root = tk.Tk()
root.title("OS Logout Popup")
root.configure(bg="#69485e")

# Load images
logout_img = Image.open("/home/Fuya/logoutpop/logout.png").resize((60, 60))
logout_img = ImageTk.PhotoImage(logout_img)

reboot_img = Image.open("/home/Fuya/logoutpop/reboot.png").resize((60, 60))
reboot_img = ImageTk.PhotoImage(reboot_img)

shutdown_img = Image.open("/home/Fuya/logoutpop/shutdown.png").resize((60, 60))
shutdown_img = ImageTk.PhotoImage(shutdown_img)

# Create buttons with images
logout_btn = tk.Button(root, image=logout_img, command=logout, bg="#69485e", bd=0, highlightbackground="#69485e")
logout_btn.grid(row=0, column=0, padx=10, pady=10)

reboot_btn = tk.Button(root, image=reboot_img, command=reboot, bg="#69485e", bd=0, highlightbackground="#69485e")
reboot_btn.grid(row=0, column=1, padx=10, pady=10)

shutdown_btn = tk.Button(root, image=shutdown_img, command=shutdown, bg="#69485e", bd=0, highlightbackground="#69485e")
shutdown_btn.grid(row=0, column=2, padx=10, pady=10)

# Keep a reference to the images to prevent garbage collection
logout_btn.image = logout_img
reboot_btn.image = reboot_img
shutdown_btn.image = shutdown_img

root.mainloop()

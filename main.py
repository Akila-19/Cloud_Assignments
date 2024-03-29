from tkinter import *
from tkinter import messagebox

root=Tk()
root.title("CRUD")
root.geometry("350x250")
root.configure(bg="lightblue")
f=open("data.txt",'a')
f.close()

def create():
    top=Toplevel()
    top.title("Create")
    top.geometry("250x150")
    
    def submit():
        id1 = e1.get()
        name = e2.get()

        f=open("data.txt",'r')
        data=f.readlines()
        f.close()

        flag=0
        f=open("data.txt",'r')
        for lines in data:
            if id1 in lines:
                flag=1
                break
        f.close()
        if flag==1:                             #if flag is 1 the item is already in the file.
            messagebox.showwarning("Status","id already exist")
        if flag==0:                             # if flag is 0 the item is not already present in file and can write to the file
            f=open("data.txt",'a')
            f.write(id1+"\t"+name+"\n")
            messagebox.showinfo("Status","Data added succesfully")
            f.close()
        e1.delete(0,END)
        e2.delete(0,END)
        top.destroy()
        return 
        

    l1 = Label(top, text = "Id : ", font = ("Times New Roman", 10, "bold"))
    e1 = Entry(top, font = ("Times New Roman",10,"normal"))
    l2 = Label(top, text = "Name : ", font = ("Times New Roman",10,"bold"))
    e2 = Entry(top)
    B = Button(top, text = "Submit", command=submit, bg="green")
    B.grid(row=1, column=1, padx=10, pady=10)

    l1.grid(row= 0 , column = 0)
    e1.grid(row = 0, column = 1)
    l2.grid(row=1, column =0)
    e2.grid(row = 1, column =1)
    B.grid(row = 3,column = 1)
  

    top.mainloop()
        
def read():
    top=Toplevel()
    top.title("Read")
    top.geometry("500x500")
    def read1():
        f=open("data.txt",'r')
        data=f.readlines()
        f.close()

    #sorting
        data.sort()

    #rewriting
        f=open("data.txt",'r+')
        f.writelines(data)
        f.close()

    #reading
        f=open("data.txt",'r')
        var=StringVar()
        var.set(f.read())
        l=Label(top,text="ID",font = ("Times New Roman", 10, "bold")).grid(row=0,column=0)
        l2=Label(top,text="Name",font = ("Times New Roman", 10, "bold")).grid(row=0,column=1)
        m=Message(top, width=1000,textvariable=var).grid(row=1,column = 1)
    read1()
    top.mainloop()


def update():
    top=Toplevel()
    top.title("Update")
    top.geometry("250x150")
    def update1():
        s= e1.get()
        f=open('data.txt','r')
        flag=0
        index=0

        for line in f:
            index=index+1
            if s in line:
                flag=1
                break
        if flag==0:
            messagebox.showwarning("status","id not found")
        if flag == 1 :
    #copying
            f=open('data.txt','r')
            data=f.readlines()
            f.close()

    #deleting old data
            del data[index-1]
            f=open('data.txt','w')
            f.writelines(data)
            f.close()

    #read update info
            a=e1.get()
            b=e2.get()
            d=(a+"\t"+b+"\n")
            data.append(d)

    #rewriting
            f=open('data.txt','w')
            f.writelines(data)
            f.close()
            messagebox.showinfo("status","Data updated successfully")
        e1.delete(0,END)
        e2.delete(0,END)
        top.destroy()

    l1 = Label(top, text = "Id : ", font = ("Times New Roman", 10, "bold"))
    e1 = Entry(top, font = ("Times New Roman",10,"normal"))
    l2 = Label(top, text = "Name : ", font = ("Times New Roman",10,"bold"))
    e2 = Entry(top)
    B = Button(top, text = "Update", command=update1, bg="green")
    B.grid(row=1, column=1, padx=10, pady=10)
    l1.grid(row= 0 , column = 0)
    e1.grid(row = 0, column = 1)
    l2.grid(row=1, column =0)
    e2.grid(row = 1, column =1)
    B.grid(row = 3,column = 1)
    top.mainloop()

def delete():
    top=Toplevel()
    top.title("Delete")
    top.geometry("250x150")
    def delete1():
        #searching
        s= e1.get()
        f=open('data.txt','r')
        flag=0
        index=0
        for line in f:
            index=index+1
            if s in line:
                flag=1
                break
        if flag==0:
            messagebox.showwarning("Status","id not found")
        if flag == 1 :
    #copying
            f=open('data.txt','r')
            data=f.readlines()
            f.close()

    #deleting
            del data[index-1]
            messagebox.showinfo("Status","Data Deleted")
    #rewriting
            f=open('data.txt','w')
            f.writelines(data)
            f.close()
        top.destroy()
    l1 = Label(top, text = "Id : ", font = ("Times New Roman", 10, "bold"))
    e1 = Entry(top, font = ("Times New Roman",10,"normal"))
    B = Button(top, text = "Delete", command=delete1, bg="red")
    B.grid(row=1, column=1, padx=10, pady=10)
    l1.grid(row= 0 , column = 0)
    e1.grid(row = 0, column = 1)
    B.grid(row = 3,column = 1)
    top.mainloop()

def Exit():
    return root.destroy()
    
l1=Label(root,text="MENU", fg="dark blue",font = ("Times New Roman", 10, "bold")).grid(row=0,column=3, padx=20, pady=40 )
b1=Button(root,text="Create",width=7,height=1,command = create,bg="#4CAF50", fg="white").grid(row=1,column=1, padx=5 )
b2=Button(root,text="Read",width=7,height=1,command=read,  bg="#2196F3").grid(row=1,column=2, padx=5)
b3=Button(root,text="Update",width=7,height=1,command=update,bg="#FFC107").grid(row=1,column=3, padx=5 )
b4=Button(root,text="Delete",width=7,height=1,command=delete, bg="#D32F2F").grid(row=1,column=4, padx=5 )
b4=Button(root,text="Exit",width=7,height=1,command=Exit).grid(row=1,column=5, padx=5)
    
root.mainloop()

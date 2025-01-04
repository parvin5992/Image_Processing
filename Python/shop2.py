class Product:
    def __init__(self,productCode,productName,price,color):
        self.productCode=productCode
        self.productName=productName
        self.price=price
        self.color=color

    def showProductInfo(self):
        print(f'Code : {self.productCode}\tName : {self.productName}\tPrice : {self.price}')
    
#-------------------------------------------------------------
class Clothing(Product):
    def __init__(self,productCode,productName,price,size,color):
        super().__init__(productCode,productName,price,color)
        self.size=size
        

    def __str__(self):
        return f'Code : {self.productCode}\tName : {self.productName}\tPrice : {self.price}\t Size: {self.size}\t Color : {self.color}'

#-------------------------------------------------------------
class Food(Product):
    def __init__(self,productCode,productName,price,expirationDate,color='nocolor'):
        super().__init__(productCode,productName,price,color)
        self.expirationDate=expirationDate

    def __str__(self):
        return f'Code : {self.productCode}\tName : {self.productName}\tPrice : {self.price}\tExpirationDate : {self.expirationDate}\tColor : {self.color}'
#-------------------------------------------------------------   
class Appliances(Product):
    def __init__(self,productCode,productName,price, brand, model,color):
        super().__init__(productCode,productName,price,color)
        self.brand = brand
        self.model = model

    def __str__(self):
        return f'Code : {self.productCode}\tName : {self.productName}\tPrice : {self.price}\tBrand : {self.brand}\tModel : {self.model}\tColor : {self.color}'

    def __del__(self):
        print("********************************")
#-------------------------------------------------------------

# code=int(input("Enter Prouduct Code : "))
# name=input("Enter Prouduct Name : ")
# price=int(input("Enter Prouduct Price : "))
# brand=input("Enter Prouduct Brand : ")
# model=input("Enter Prouduct Model : ")
# color=input("Enter Prouduct Color : ")
# product5=Appliances(code,name,price,brand,model,color)
# print(product5)
# del product5
# print(product5)



product1=Food(1,'Pofack',15000,'1401-01-20')
# product2=Appliances(20,'TV',18250000,'LG','4982','Black')
product3=Food(2,'Chips',20000,'1401-03-25','Yellow')
# product4=Clothing(1000,'Pirahan',450000,'XXL','Blue')

print(product1)
# print(product2)
print(product3)
# print(product4)



# product1.showProductInfo()
# product2.showProductInfo()
# product3.showProductInfo()
# product4.showProductInfo()



    
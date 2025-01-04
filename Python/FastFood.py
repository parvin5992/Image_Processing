import enum
from abc import ABC,abstractmethod
class DeliveryType(enum.Enum):
    Bike=2500
    MotorCycle=10000
    Drone=80000
#-----------------------------------------------------------------
class PizzaSize(enum.Enum):
    Mini=1
    Medium=2
    Large=5
#-----------------------------------------------------------------
class Item(ABC):
    def __init__(self):
        super().__init__()
    
    @abstractmethod
    def getCost(self):                 #محاسبه هزینه آیتم
        pass
#-----------------------------------------------------------------
class Content(ABC):
    @abstractmethod
    def getPrice(self):
        pass
#-----------------------------------------------------------------
class Tomato(Content):
    def __init__(self,weight):
        super().__init__()
        self.unitPrice=8000
        self.weight=weight/1000
    
    def getPrice(self):
        return self.unitPrice*self.weight
#-----------------------------------------------------------------
class Mushroom(Content):
    def __init__(self,weight,canned):
        super().__init__()
        self.unitPrice=30000
        if weight>0.2 :
            weight=0.2
        self.weight=weight
        self.canned=canned
    
    def getPrice(self):
        if self.canned==True :
            return self.unitPrice*self.weight
        else:
            return self.unitPrice*self.weight*2
#-----------------------------------------------------------------
class Chiken(Content):
    def __init__(self,weight):
        super().__init__()
        self.unitPrice=45000
        self.weight=weight
    
    def getPrice(self):
        return self.unitPrice*self.weight
#-----------------------------------------------------------------
class Chikenham(Content):
    def __init__(self,weight):
        super().__init__()
        self.unitPrice=12000
        self.weight=weight
    
    def getPrice(self):
        return self.unitPrice*self.weight
#-----------------------------------------------------------------
class RedMeat(Content):
    def __init__(self,weight):
        super().__init__()
        self.unitPrice=200000
        self.weight=weight
    
    def getPrice(self):
        return self.unitPrice*self.weight
#-----------------------------------------------------------------
class Cheese(Content):
    def __init__(self,weight):
        super().__init__()
        self.unitPrice=180000
        self.weight=weight
        
    def getPrice(self):
        return self.unitPrice*self.weight
#-----------------------------------------------------------------
class Pizza(Item):
    def __init__(self,size):
        self.basePrice=10000
        self.size=size
        self.contentList=[]
    
    def addContent(self,content):
        self.contentList.append(content)
        
    def getCost(self):
        sum=0
        for content in self.contentList:
            sum+=content.getPrice()
        sum*=self.size 
        sum+=self.basePrice
        return sum

#-----------------------------------------------------------------
class Drink(Item):
    def __init__(self,weight,carbonated):
        self.cc=20
        self.weight=weight
        self.carbonated=carbonated
    
    def getCost(self):
        if self.carbonated == True:
            return self.weight*self.cc+4000
        else:
            return self.weight*self.cc
#-----------------------------------------------------------------
class Order:
    def __init__(self,deliveryType):
        self.DeliveryType=deliveryType
        self.OrderItems=[]
        
    def addItem(self,item):
        self.OrderItems.append(item)
    
    def getTotalCost(self):
        sum=self.DeliveryType
        for item in self.OrderItems:
            sum+=item.getCost()
        return sum
#-----------------------------------------------------------------    
##main program :
p1=Pizza(PizzaSize.Medium.value)
p1.addContent(Tomato(200))
p1.addContent(Mushroom(0.3,True))
p1.addContent(Cheese(0.4))
p1.addContent(Chiken(0.3))

p2=Pizza(PizzaSize.Mini.value)
p2.addContent(Cheese(0.2))
p2.addContent(RedMeat(0.1))

d1=Drink(300,False)
d2=Drink(400,True)

orderMehdi=Order(DeliveryType.MotorCycle.value)
orderMehdi.addItem(p1)   
orderMehdi.addItem(d1)   
orderMehdi.addItem(d2)
orderMehdi.addItem(p2)
print(orderMehdi.getTotalCost())
   

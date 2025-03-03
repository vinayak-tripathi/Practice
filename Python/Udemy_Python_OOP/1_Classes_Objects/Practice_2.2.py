class Book:
    def __init__(self,isbn,title,author,publisher,pages,price,copies):
        self.isbn=isbn
        self.title = title
        self.author = author
        self.publisher = publisher
        self.pages = pages
        self.price = price
        self.copies = copies

    def display(self):
        print(self.title)
        print('ISBN : ',self.isbn)
        print('Price : ',self.price)
        print('Number of copies : ',self.copies)
        print('.' * 50)

    def in_stock(self):
        return True if self.copies>0 else False
    
    def sell(self):
        if self.in_stock():
            self.copies -=1
        else:print('Book out of Stock')

book1 = Book('957-4-36-547417-1', 'Learn Physics','Stephen', 'CBC', 350, 200,10)
book2 = Book('652-6-86-748413-3', 'Learn Chemistry','Jack', 'CBC', 400, 220,20)
book3 = Book('957-7-39-347216-2', 'Learn Maths','John', 'XYZ', 500, 300,5)
book4 = Book('957-7-39-347216-2', 'Learn Biology','Jack', 'XYZ', 400, 200,6)
 
book1.display()
book2.display()
book3.display()
book4.display()

book3.sell()
print('Copies remaining of ',book3.title," is",book3.copies)
book3.sell()
print('Copies remaining of ',book3.title," is",book3.copies)
book3.sell()
print('Copies remaining of ',book3.title," is",book3.copies)
book3.sell()
print('Copies remaining of ',book3.title," is",book3.copies)
book3.sell()
print('Copies remaining of ',book3.title," is",book3.copies)
book3.sell()
void mystery(x y){
    if (null y){
        return nil;
    }else{
        if((car y) == x){
            return 0;
        }else{
            let z = mystery(x cdr(y))
        }
    }
}

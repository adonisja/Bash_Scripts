function add()
{
    sum=$(($1 + $2))
    echo $sum           # echo will print here, it will return the value, notice the lack of quotes (" ") 
}

result=$(add 1 1)
echo "The sum is: $result"
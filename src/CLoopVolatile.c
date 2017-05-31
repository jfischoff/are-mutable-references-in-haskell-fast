int main (int argc, const char** argv)
{
    volatile int ref = 0;
    while (ref < 100000000)
    {
        ref++;
    }

    return 0;
}
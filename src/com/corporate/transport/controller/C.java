package com.corporate.transport.controller;


import java.io.IOException;

class A
{
	
	public A()
	{
		System.out.println("A()");
		System.out.println(this.getClass().getName());
		this.get();
	}

	private void get()
	{
		System.out.println("get A");
		System.out.println(this.getClass().getName());
	}
}

class B extends A
{
	public B()
	{
		System.out.println("B()");
	}

	public void get()
	{
		System.out.println("get B");
	}
}

public class C extends B
{

	public static void main(String[] args) {
		A a = new B();
		//a.get();
	}
}



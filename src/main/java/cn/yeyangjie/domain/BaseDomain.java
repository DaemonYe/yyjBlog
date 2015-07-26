package cn.yeyangjie.domain;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;

//1.实现了Serializable接口，以便JVM可以序列化PO实例
public class BaseDomain implements Serializable {

	// 2.统一的toString()方法
	public String toString() {
		return ReflectionToStringBuilder.toString(this);
	}
}

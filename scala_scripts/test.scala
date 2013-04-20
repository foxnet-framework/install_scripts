#!/usr/bin/env scala



import java.io.{BufferedOutputStream, File, FileOutputStream}
import scala.io.Source


for (file <- new File("/home/kr0e").listFiles) {
  if (!file.isDirectory) {
//    val src = Source.fromFile(file)
//    val count = src.getLines.foldLeft(0) { (i, line) => i + 1 }
 
    println(file)
  }
}
